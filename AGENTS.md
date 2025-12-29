# IntelliJ Theme Converter

This project converts IntelliJ IDEA Darcula theme to multiple formats:
- **tmTheme** (TextMate/Sublime Text) for tools like `bat`, VS Code, or Sublime Text
- **Neovim colorscheme** (Lua, requires latest Neovim)

## Input Files

**Color Scheme XML** (`DefaultColorSchemesManager.xml`): Contains the IntelliJ syntax highlighting colors. Look for the `<scheme name="Darcula">` section.

## Key IntelliJ Darcula Colors

| IntelliJ Attribute | Hex Color | Usage |
|-------------------|-----------|-------|
| `DEFAULT_KEYWORD` | `#CC7832` | Keywords, operators, orange |
| `DEFAULT_STRING` | `#6A8759` | Strings, green |
| `DEFAULT_NUMBER` | `#6897BB` | Numbers, blue |
| `DEFAULT_CONSTANT` | `#9876AA` | Constants, purple (+ italic) |
| `DEFAULT_INSTANCE_FIELD` | `#9876AA` | Instance fields, purple |
| `DEFAULT_STATIC_FIELD` | `#9876AA` | Static fields, purple (+ italic) |
| `DEFAULT_DOC_COMMENT` | `#6A8759` | Doc comments, green |
| `TYPE_PARAMETER_NAME_ATTRIBUTES` | `#507874` | Generic type params like `T`, teal |
| `HYPERLINK_ATTRIBUTES` | `#287BDE` | Links, blue |
| Default foreground | `#A9B7C6` | Normal text |
| Neutral | `#CCCCCC` | Default punctuation |

## Test Files

The `tests/` directory contains example files for each supported language:

- `tests/Example.java` - Java classes, generics, annotations, constants, lambdas
- `tests/example.py` - Python constants, f-strings, decorators, docstrings
- `tests/example.sh` - Shell variables, builtins, command substitution, pipes
- `tests/example.yaml` - YAML keys, quoted/unquoted strings, nested structures
- `tests/example.md` - Markdown headers, links, code blocks, lists

## What to Verify

| Language | Key Elements to Check |
|----------|----------------------|
| Java | Constants purple+italic, `@annotations` yellow, `<T>` teal, constructors yellow, function calls white, `;` orange, javadoc green |
| Python | `None/True/False` purple+italic, `CONSTANTS` purple+italic, f-string `{}` purple, docstrings green+italic |
| Shell | `$VAR` purple, `$` orange, builtins orange, external commands orange |
| YAML | Keys orange, unquoted values white, quoted strings green |
| Markdown | Headings purple+italic, `#` markers orange, list markers orange, links blue, code green, backticks orange, link `()` green |
| Vimdoc | Headings olive, `*tags*` labels orange, links cyan+underline (Neovim only) |
| Gitcommit | Prefix `type:` orange, subject text olive, branch names white, `modified:` orange, file paths purple |

---

# bat (tmTheme)

Location: `themes/darcula.tmTheme`

## Configuration

Add to `~/.config/bat/config`:
```
--italic-text=always
```

This is required for italic styles to render.

## Finding the Correct Scopes

**CRITICAL**: Always check the Sublime syntax files before making changes to the colorscheme. The syntax files are the source of truth for what scopes are applied.
**Do NOT create custom bat syntaxes** - work within the limitations of existing syntaxes.

Examine the Sublime syntax files in `~/Projects/bat/assets/syntaxes/`. Search in `01_Packages/` or `02_Extra/`.

The syntax files define what `scope` is applied to each syntax element. Search for patterns like:
- `scope: constant.other.java` - shows what scope is assigned
- `- include: uppercase-identifiers` - shows context includes

## Style Guidelines

- Use `#RRGGBB` format for colors (IntelliJ uses 6-digit hex without #)
- Convert IntelliJ `FONT_TYPE` values: 1=bold, 2=italic, 3=bold italic
- Place more specific scope rules AFTER general ones (later rules override)
- **Prefer generic scopes** over language-specific when the styling should be consistent across languages
- **Clean up duplicate rules** - avoid having the same scope with same styling in multiple places

## Testing

**IMPORTANT**: After modifying the theme, you MUST copy it and rebuild the cache. bat loads from `~/.config/bat/themes/`, not from this repository.

```bash
# Copy theme and rebuild cache (REQUIRED after every edit)
cp themes/darcula.tmTheme ~/.config/bat/themes/
bat cache --build

# Test each language
bat tests/Example.java
bat tests/example.py
bat tests/example.sh
bat tests/example.yaml
bat tests/example.md
```

---

# Neovim Colorscheme

Location: `colors/darcula.lua`

## Installation

### vim-plug (recommended)

Add to your vim-plug configuration:

```vim
Plug 'StenAL/darcula-themes'
```

Then run `:PlugInstall` and activate with:

```vim
colorscheme darcula
```

### Manual Installation

Copy the colorscheme and custom queries to your Neovim config:

```bash
# Copy colorscheme
cp colors/darcula.lua ~/.config/nvim/colors/

# Copy custom treesitter queries (required for markdown styling)
cp -r after ~/.config/nvim/

# Copy lualine theme (optional, if using lualine)
cp -r lua ~/.config/nvim/
```

## Lualine Theme

Location: `lua/lualine/themes/darcula.lua`

To use the lualine theme, add to your config:

```lua
require('lualine').setup({
    options = { theme = 'darcula' }
})
```

## Custom Treesitter Queries

The custom queries in `after/queries/` override default nvim-treesitter behavior:

| Query | Effect |
|-------|--------|
| `markdown/highlights.scm` | Heading markers (`#`) and fenced code block delimiters (` ``` `) orange |
| `markdown_inline/highlights.scm` | Inline code backticks orange, link parentheses green |
| `java/highlights.scm` | Type parameters (`T`) teal, constructor names yellow |
| `python/highlights.scm` | `None`/`True`/`False` purple+italic, f-string `{}` purple |
| `bash/highlights.scm` | Commands orange, operators/delimiters white, test brackets `[]` orange, file descriptors blue |
| `yaml/highlights.scm` | Comments green, keys orange, unquoted values white, anchors/aliases yellow, constants purple |
| `gitcommit/highlights.scm` | ERROR nodes (text on line 2) red, branch names white (high priority to override parent comment) |

## Adding New Highlight Groups

**CRITICAL**: Always prefer treesitter highlights over vim syntax highlights.

1. **First**, check if a treesitter parser exists for the filetype
2. **Then**, check what captures nvim-treesitter defines for that parser
3. **Only** fall back to vim syntax groups (like `gitcommitSummary`) if no treesitter parser exists

Treesitter highlights use the `@capture.filetype` pattern (e.g., `@markup.heading.gitcommit`).

## Finding Treesitter Captures

**CRITICAL**: BEFORE making any changes to treesitter highlight groups, parse a test file to see the actual syntax tree. Do NOT guess capture names.
**Only create custom treesitter queries if absolutely necessary** - work within the limitations of existing captures.

### Step 1: Parse the file with tree-sitter

Use the tree-sitter CLI to see the actual node structure. The parsers from nvim-treesitter are located at `~/.local/share/nvim/site/parser/`. Use `--lib-path` and `--lang-name` to specify the parser:

```bash
# Parse markdown
tree-sitter parse tests/example.md \
  --lib-path ~/.local/share/nvim/site/parser/markdown.so \
  --lang-name markdown

# Parse other languages (replace language name and .so file)
tree-sitter parse tests/Example.java \
  --lib-path ~/.local/share/nvim/site/parser/java.so \
  --lang-name java
```

This shows the syntax tree with node types like `atx_heading`, `atx_h1_marker`, `code_span`, etc.

### Step 2: Check what captures are applied to those nodes

Query files location:
```
# vim-plug
~/.local/share/nvim/plugged/nvim-treesitter/runtime/queries/<language>/
```

Search for the node types you found in step 1:
```bash
grep -n "atx_h1_marker\|atx_heading" ~/.local/share/nvim/plugged/nvim-treesitter/runtime/queries/markdown/highlights.scm
```

### Step 3: Understand the capture syntax

The query syntax `(parent_node (child_node)) @capture.name` shows what highlight groups are available:
```scheme
(atx_heading
  (atx_h1_marker)) @markup.heading.1
```
This means the ENTIRE `atx_heading` node is captured as `@markup.heading.1`.

## Testing

**IMPORTANT**: After modifying the colorscheme, you MUST copy the files to the nvim config directory. The user's nvim loads from `~/.config/nvim/`, not from this repository.

```bash
# Copy colorscheme to nvim config (REQUIRED after every edit)
cp colors/darcula.lua ~/.config/nvim/colors/

# Copy custom treesitter queries (if modified)
cp -r after/queries/* ~/.config/nvim/after/queries/
```

Then restart Neovim or run `:colorscheme darcula` to reload.
