-- Darcula theme for lualine
local colors = {
    bg = '#3C3F41',
    fg = '#BBBBBB',
    muted = '#787878',
    middle = '#313335',
}

local common = {
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.middle },
}

return {
    normal = { a = { fg = colors.fg, bg = colors.bg }, b = common.b, c = common.c },
    insert = { a = { fg = '#499C54', bg = colors.bg }, b = common.b, c = common.c },
    visual = { a = { fg = '#3592C4', bg = colors.bg }, b = common.b, c = common.c },
    replace = { a = { fg = '#C75450', bg = colors.bg }, b = common.b, c = common.c },
    command = { a = { fg = colors.fg, bg = colors.bg }, b = common.b, c = common.c },
    inactive = { a = { fg = colors.muted, bg = colors.bg }, b = { fg = colors.muted, bg = colors.bg }, c = { fg = colors.muted, bg = colors.middle } },
}
