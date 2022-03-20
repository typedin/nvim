vim.g.highlightedyank_highlight_duration = 100
vim.opt.shortmess = vim.opt.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess = vim.opt.shortmess + 'I' -- no splash screen
vim.opt.showbreak = '↳ ' -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.opt.termguicolors = true -- use guifg/guibg instead of ctermfg/ctermbg in terminal

vim.cmd([[
    syntax on
    set ma
    set mouse=a
    set cursorline
    set tabstop=4
    set signcolumn=yes:2
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoread
    set nobackup
    set nowritebackup
    set noswapfile
    set number
    set relativenumber
    set foldlevelstart=99
    set scrolloff=7
    "use y and p with the system clipboard
    set clipboard=unnamedplus
]])
