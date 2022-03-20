vim.opt.termguicolors = true

-- -- @see here : https://github.com/EdenEast/nightfox.nvim
require("nightfox").setup {
    options = {
        transparent = true,
        dim_inactive = true,
        styles = {
            comments = "italic", -- change style of comments to be italic
            keywords = "bold", -- change style of keywords to be bold
            functions = "italic,bold", -- styles can be a comma separated list
        },
    },
}
vim.cmd [[
    colorscheme duskfox
    hi! EndOfBuffer guifg=#000000 guibg=#000000
    hi! VertSplit guibg=#000000 guifg=#000000
    hi! SignColumn guibg=#000000 guifg=#000000

    hi! Normal guibg=#000000 guifg=#ffffff
    hi LineNr ctermbg=NONE guibg=NONE
    highlight Comment cterm=italic gui=italic
    hi ActiveWindow guibg=#000000
    hi InactiveWindow guibg=#000000
    augroup BgHighlight
        autocmd!
        autocmd WinEnter * set cul
        autocmd WinLeave * set nocul
        " don't show lualine in NvimTree
        au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if stridx(bufname('%'), "NvimTree") >= 0 | set laststatus=0 | else | set laststatus=2 | endif
    augroup END
]]
