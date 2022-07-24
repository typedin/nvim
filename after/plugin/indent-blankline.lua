-- whitespace
vim.g.indent_blankline_enabled = false
vim.opt.list = true -- show whitespace

vim.opt.listchars = {
    nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    tab = "▷┅", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
    trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
}
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:·"
vim.opt.listchars:append "trail:•"
vim.opt.listchars:append "nbsp:⦸"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
