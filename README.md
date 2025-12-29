> **Warning**: I created this project to test out AI tooling. Almost all of the contents are AI-generated and kind of suck but it's good enough for personal use.

# darcula-themes

A faithful port of IntelliJ IDEA's Darcula theme for Neovim and bat/Sublime Text.

## Features

- Accurate IntelliJ Darcula colors
- Treesitter support with language-specific highlighting
- LSP semantic token support
- Lualine theme included
- tmTheme for bat, Sublime Text, and VS Code

## Installation

### Neovim (vim-plug)

```vim
Plug 'StenAL/darcula-themes'
```

Then activate:

```vim
colorscheme darcula
```

#### Lualine

A matching lualine theme is included:

```lua
require('lualine').setup({
  options = { theme = 'darcula' }
})
```

### bat

```bash
cp themes/darcula.tmTheme ~/.config/bat/themes/
bat cache --build
```

Add to `~/.config/bat/config`:

```
--theme="darcula"
--italic-text="always"
```

## Color Palette

| Color      | Hex       | Usage                 |
| ---------- | --------- | --------------------- |
| Background | `#2B2B2B` | Editor background     |
| Foreground | `#A9B7C6` | Default text          |
| Orange     | `#CC7832` | Keywords, operators   |
| Green      | `#6A8759` | Strings, doc comments |
| Blue       | `#6897BB` | Numbers               |
| Purple     | `#9876AA` | Constants, fields     |
| Teal       | `#507874` | Type parameters       |
| Yellow     | `#FFC66D` | Functions             |
| Olive      | `#BBB529` | Annotations           |
| Gray       | `#808080` | Comments              |
| Cyan       | `#287BDE` | Links                 |

## Requirements

- Neovim 0.9+ (for Lua colorscheme)
- nvim-treesitter (recommended)
- Terminal with true color support

## License

MIT
