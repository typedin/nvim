vim.g.cursorword_highlight = false

vim.cmd('highlight link CursorWord Pmenu')

local nvim_cursorline = require("nvim-cursorline")

nvim_cursorline.setup {
    cursorline = {
        enable = true,
        timeout = 0,
        number = true,
    },
    cursorword = {
        enable = false,
        -- min_length = 3,
        -- hl = { underline = true },
    },
}
