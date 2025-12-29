-- Darcula colorscheme for Neovim
-- Based on IntelliJ IDEA Darcula theme

vim.cmd.highlight('clear')
vim.g.colors_name = 'darcula'
vim.o.termguicolors = true

local colors = {
  bg = '#2B2B2B',
  fg = '#A9B7C6',
  gray = '#808080',
  dim = '#606366',
  orange = '#CC7832',
  green = '#6A8759',
  bright_green = '#629755',
  blue = '#6897BB',
  purple = '#9876AA',
  teal = '#507874',
  cyan = '#287BDE',
  red = '#BC3F3C',
  yellow = '#FFC66D',
  olive = '#BBB529',
  amber = '#BE9117',
  cursor_line = '#323232',    -- charcoal
  selection = '#214283',      -- blue
  search = '#32593D',         -- green
  search_current = '#155221', -- green
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi('Normal', { fg = colors.fg, bg = colors.bg })
hi('NormalFloat', { fg = colors.fg, bg = colors.bg })
hi('Cursor', { fg = colors.bg, bg = colors.fg })
hi('CursorLine', { bg = colors.cursor_line })
hi('CursorColumn', { bg = colors.cursor_line })
hi('LineNr', { fg = colors.dim })
hi('CursorLineNr', { fg = colors.fg })
hi('SignColumn', { bg = colors.bg })
hi('VertSplit', { fg = colors.dim })
hi('WinSeparator', { fg = colors.dim })
hi('ColorColumn', { bg = colors.cursor_line })
hi('Folded', { fg = colors.gray, bg = colors.cursor_line })
hi('FoldColumn', { fg = colors.dim, bg = colors.bg })
hi('NonText', { fg = colors.dim })
hi('SpecialKey', { fg = colors.dim })
hi('Whitespace', { fg = colors.dim })

-- Search
hi('Search', { bg = colors.search })
hi('IncSearch', { bg = colors.search_current })
hi('CurSearch', { bg = colors.search_current })

-- Selection
hi('Visual', { bg = colors.selection })
hi('VisualNOS', { bg = colors.selection })

-- Statusline
hi('StatusLine', { fg = colors.fg, bg = colors.cursor_line })
hi('StatusLineNC', { fg = colors.gray, bg = colors.cursor_line })
hi('WildMenu', { fg = colors.fg, bg = colors.selection })

-- Tabline
hi('TabLine', { fg = colors.gray, bg = colors.cursor_line })
hi('TabLineFill', { bg = colors.cursor_line })
hi('TabLineSel', { fg = colors.fg, bg = colors.bg })

-- Popup menu
hi('Pmenu', { fg = colors.fg, bg = colors.cursor_line })
hi('PmenuSel', { bg = colors.selection })
hi('PmenuSbar', { bg = colors.cursor_line })
hi('PmenuThumb', { bg = colors.dim })

-- Messages
hi('ErrorMsg', { fg = colors.red })
hi('WarningMsg', { fg = colors.amber })
hi('ModeMsg', { fg = colors.fg })
hi('MoreMsg', { fg = colors.fg })
hi('Question', { fg = colors.fg })
hi('MsgArea', { fg = colors.fg })

-- Diff
hi('DiffAdd', { bg = '#294436' })
hi('DiffChange', { bg = '#303C47' })
hi('DiffDelete', { fg = colors.red, bg = '#48282B' })
hi('DiffText', { bg = '#385570' })
hi('Added', { fg = colors.green })
hi('Changed', { fg = colors.blue })
hi('Removed', { fg = colors.red })

-- Diagnostics
hi('DiagnosticError', { fg = colors.red })
hi('DiagnosticWarn', { fg = colors.amber })
hi('DiagnosticInfo', { fg = colors.blue })
hi('DiagnosticHint', { fg = colors.green })
hi('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
hi('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.amber })
hi('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.blue })
hi('DiagnosticUnderlineHint', { undercurl = true, sp = colors.green })

-- Spelling
hi('SpellBad', { undercurl = true, sp = colors.red })
hi('SpellCap', { undercurl = true, sp = colors.amber })
hi('SpellLocal', { undercurl = true, sp = colors.blue })
hi('SpellRare', { undercurl = true, sp = colors.green })

-- Syntax
hi('Comment', { fg = colors.gray, italic = true })
hi('Constant', { fg = colors.purple, italic = true })
hi('String', { fg = colors.green })
hi('Character', { fg = colors.green })
hi('Number', { fg = colors.blue })
hi('Boolean', { fg = colors.orange })
hi('Float', { fg = colors.blue })
hi('Identifier', { fg = colors.fg })
hi('Function', { fg = colors.yellow })
hi('Statement', { fg = colors.orange })
hi('Conditional', { fg = colors.orange })
hi('Repeat', { fg = colors.orange })
hi('Label', { fg = colors.orange })
hi('Operator', { fg = colors.orange })
hi('Keyword', { fg = colors.orange })
hi('Exception', { fg = colors.orange })
hi('PreProc', { fg = colors.orange })
hi('Include', { fg = colors.orange })
hi('Define', { fg = colors.orange })
hi('Macro', { fg = colors.orange })
hi('PreCondit', { fg = colors.orange })
hi('Type', { fg = colors.orange })
hi('StorageClass', { fg = colors.orange })
hi('Structure', { fg = colors.orange })
hi('Typedef', { fg = colors.orange })
hi('Special', { fg = colors.orange })
hi('SpecialChar', { fg = colors.orange })
hi('Tag', { fg = colors.orange })
hi('Delimiter', { fg = colors.fg })
hi('SpecialComment', { fg = colors.gray, italic = true })
hi('Debug', { fg = colors.red })
hi('Underlined', { fg = colors.cyan, underline = true })
hi('Error', { fg = colors.red })
hi('Todo', { fg = colors.olive, bold = true })
hi('Title', { fg = colors.yellow, bold = true })
hi('Directory', { fg = colors.blue })
hi('MatchParen', { bold = true, underline = true })

-- Treesitter
hi('@variable', { fg = colors.fg })
hi('@variable.builtin', { fg = colors.orange })
hi('@variable.parameter', { fg = colors.fg })
hi('@variable.member', { fg = colors.purple })
hi('@constant', { fg = colors.purple, italic = true })
hi('@constant.builtin', { fg = colors.orange })
hi('@constant.macro', { fg = colors.purple })
hi('@module', { fg = colors.fg })
hi('@label', { fg = colors.purple })
hi('@string', { fg = colors.green })
hi('@string.documentation', { fg = colors.green, italic = true })
hi('@string.regexp', { fg = colors.green })
hi('@string.escape', { fg = colors.orange })
hi('@string.special', { fg = colors.orange })
hi('@string.special.url', { fg = colors.cyan, underline = true })
hi('@character', { fg = colors.green })
hi('@character.special', { fg = colors.orange })
hi('@boolean', { fg = colors.orange })
hi('@number', { fg = colors.blue })
hi('@number.float', { fg = colors.blue })
hi('@type', { fg = colors.fg })
hi('@type.builtin', { fg = colors.orange })
hi('@type.parameter', { fg = colors.teal })
hi('@type.definition', { fg = colors.fg })
hi('@type.qualifier', { fg = colors.orange })
hi('@attribute', { fg = colors.olive })
hi('@property', { fg = colors.purple })
hi('@function', { fg = colors.yellow })
hi('@function.builtin', { fg = colors.yellow })
hi('@function.call', { fg = colors.fg })
hi('@function.macro', { fg = colors.yellow })
hi('@function.method', { fg = colors.yellow })
hi('@function.method.call', { fg = colors.fg })
hi('@constructor', { fg = colors.yellow })
hi('@operator', { fg = colors.orange })
hi('@keyword', { fg = colors.orange })
hi('@keyword.coroutine', { fg = colors.orange })
hi('@keyword.function', { fg = colors.orange })
hi('@keyword.operator', { fg = colors.orange })
hi('@keyword.import', { fg = colors.orange })
hi('@keyword.storage', { fg = colors.orange })
hi('@keyword.repeat', { fg = colors.orange })
hi('@keyword.return', { fg = colors.orange })
hi('@keyword.debug', { fg = colors.orange })
hi('@keyword.exception', { fg = colors.orange })
hi('@keyword.conditional', { fg = colors.orange })
hi('@keyword.conditional.ternary', { fg = colors.orange })
hi('@keyword.directive', { fg = colors.orange })
hi('@keyword.directive.define', { fg = colors.orange })
hi('@punctuation', { fg = colors.fg })
hi('@punctuation.delimiter', { fg = colors.orange })
hi('@punctuation.bracket', { fg = colors.fg })
hi('@punctuation.special', { fg = colors.orange })
hi('@comment', { fg = colors.gray, italic = true })
hi('@comment.documentation', { fg = colors.green, italic = true })
hi('@comment.error', { fg = colors.red, bold = true })
hi('@comment.warning', { fg = colors.amber, bold = true })
hi('@comment.todo', { fg = colors.olive, bold = true })
hi('@comment.note', { fg = colors.blue, bold = true })
hi('@markup.heading', { fg = colors.purple, italic = true })
hi('@markup.heading.1', { fg = colors.purple, italic = true })
hi('@markup.heading.2', { fg = colors.purple, italic = true })
hi('@markup.heading.3', { fg = colors.purple, italic = true })
hi('@markup.heading.4', { fg = colors.purple, italic = true })
hi('@markup.heading.5', { fg = colors.purple, italic = true })
hi('@markup.heading.6', { fg = colors.purple, italic = true })
hi('@markup.quote', { fg = colors.green, italic = true })
hi('@markup.math', { fg = colors.blue })
hi('@markup.link', { fg = colors.cyan, underline = true })
hi('@markup.link.label', { fg = colors.cyan })
hi('@markup.link.url', { fg = colors.cyan, underline = true })
hi('@markup.raw', { fg = colors.green })
hi('@markup.raw.block', { fg = colors.green })
hi('@markup.list', { fg = colors.orange })
hi('@markup.list.checked', { fg = colors.green })
hi('@markup.list.unchecked', { fg = colors.gray })
hi('@markup.strong', { bold = true })
hi('@markup.italic', { italic = true })
hi('@markup.strikethrough', { strikethrough = true })
hi('@tag', { fg = colors.orange })
hi('@tag.attribute', { fg = colors.olive })
hi('@tag.delimiter', { fg = colors.fg })
hi('@diff.plus', { fg = colors.bright_green })
hi('@diff.minus', { fg = colors.red })
hi('@diff.delta', { fg = colors.blue })

-- LSP semantic tokens
hi('@lsp.type.class', { fg = colors.fg })
hi('@lsp.type.decorator', { fg = colors.olive })
hi('@lsp.type.enum', { fg = colors.fg })
hi('@lsp.type.enumMember', { fg = colors.purple, italic = true })
hi('@lsp.type.function', { fg = colors.yellow })
hi('@lsp.type.interface', { fg = colors.fg })
hi('@lsp.type.macro', { fg = colors.yellow })
hi('@lsp.type.method', { fg = colors.yellow })
hi('@lsp.type.namespace', { fg = colors.fg })
hi('@lsp.type.parameter', { fg = colors.fg })
hi('@lsp.type.property', { fg = colors.purple })
hi('@lsp.type.struct', { fg = colors.fg })
hi('@lsp.type.type', { fg = colors.fg })
hi('@lsp.type.typeParameter', { fg = colors.teal })
hi('@lsp.type.variable', { fg = colors.fg })
hi('@lsp.mod.constant', { italic = true })
hi('@lsp.mod.readonly', { italic = true })
hi('@lsp.mod.static', { italic = true })

-- Custom highlights (require nvim/after/queries/)
-- Markdown
hi('@markup.heading.marker', { fg = colors.orange })  -- # markers
hi('@markup.raw.delimiter', { fg = colors.orange })   -- backticks (` and ```)
hi('@markup.link.paren', { fg = colors.green })       -- link parentheses ()
-- Python
hi('@constant.language', { fg = colors.purple, italic = true })  -- None/True/False
hi('@string.special.symbol', { fg = colors.purple })             -- f-string { }
-- Bash
hi('@keyword.command', { fg = colors.orange })                   -- all commands

-- Man pages
hi('manSubHeading', { fg = colors.orange })                      -- subheadings (was yellow via Function)
hi('manBold', { fg = colors.orange })                            -- bold text (no bold)
hi('manItalic', { fg = colors.purple, underline = true })        -- arg placeholders like SCHEME (neovim uses italic for _^H sequences)

-- Vimdoc
hi('@markup.heading.1.vimdoc', { fg = colors.olive })            -- h1 headings (===)
hi('@markup.heading.2.vimdoc', { fg = colors.olive })            -- h2 headings (---)
hi('@markup.heading.3.vimdoc', { fg = colors.olive })            -- h3 headings
hi('@markup.heading.4.vimdoc', { fg = colors.olive })            -- column headings
hi('@label.vimdoc', { fg = colors.orange })                      -- *tags* labels
hi('@markup.link.vimdoc', { fg = colors.cyan, underline = true }) -- |links|

-- Git commit (treesitter: gitcommit + diff parsers)
hi('@markup.heading.gitcommit', { fg = colors.olive })           -- subject line text (after prefix)
hi('@keyword.gitcommit', { fg = colors.orange })                 -- prefix type (feat, fix, etc.)
hi('@markup.link.gitcommit', { fg = colors.fg })                 -- branch name in "On branch main"
hi('@string.special.path.gitcommit', { fg = colors.purple })     -- file paths
hi('@error.gitcommit', { fg = colors.red })                      -- text on line 2 (should be blank)
