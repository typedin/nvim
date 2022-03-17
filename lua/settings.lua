local home = vim.env.HOME
local config = home .. '/.config/nvim'
local root = vim.env.USER == 'root'
local vi = vim.v.progname == 'vi'

vim.opt.encoding = "utf-8"
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.o.completeopt = "menuone,noselect,noinsert"

vim.opt.showcmd = false
vim.opt.mouse = "a" -- Enable your mouse
vim.opt.signcolumn = "yes:2" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.emoji = false -- don't assume all emoji are double width

vim.opt.scrolloff = 10 -- start scrolling 3 lines before edge of viewportvim.opt.modelines
vim.opt.pumblend = 10 -- pseudo-transparency for popup-menu
vim.opt.number = true
vim.opt.relativenumber = true -- show relative numbers in gutter

vim.opt.joinspaces = false -- don't autoinsert two spaces after '.', '?', '!' for join command
vim.opt.lazyredraw = true -- don't bother updating screen during macro playback
vim.opt.linebreak = false -- wrap long lines at characters in 'breakat'
vim.g.highlightedyank_highlight_duration = 100

-- tabs
vim.cmd("set ts=4") -- Insert 4 spaces for a tab
vim.cmd("set sw=4") -- Change the number of space characters inserted for indentation
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.smartindent = true -- Makes indenting smart

-- vim.o.wrap = true
vim.o.cursorline = true

vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.syntax = "yes"
vim.opt.backupcopy = "yes"

vim.opt.backupdir = vim.fn.expand('~/.config/nvim/backup//')
vim.opt.backupdir = vim.opt.backupdir + '.'

-- folding
vim.opt.foldlevel = 1
vim.opt.foldlevelstart = 99 -- start unfolded
vim.opt.foldmethod = 'indent' -- not as cool as syntax, but faster

-- whitespace
vim.g.indent_blankline_enabled = false
vim.opt.list = true -- show whitespace

vim.opt.listchars = {
    nbsp = '⦸', -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    extends = '»', -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes = '«', -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    tab = '▷┅', -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
    trail = '•' -- BULLET (U+2022, UTF-8: E2 80 A2)
}

vim.cmd("set tabline=0")
vim.cmd("set backspace=indent,start,eol")

vim.opt.shell = 'sh' -- shell to use for `!`, `:!`, `system()` etc.
vim.opt.shiftround = false -- don't always indent by multiple of shiftwidth
vim.opt.shiftwidth = 4 -- spaces per tab (when shifting)
vim.opt.shortmess = vim.opt.shortmess + 'A' -- ignore annoying swapfile messages
vim.opt.shortmess = vim.opt.shortmess + 'I' -- no splash screen
vim.opt.shortmess = vim.opt.shortmess + 'O' -- file-read message overwrites previous
vim.opt.shortmess = vim.opt.shortmess + 'T' -- truncate non-file messages in middle
vim.opt.shortmess = vim.opt.shortmess + 'W' -- don't echo "[w]"/"[written]" when writing
vim.opt.shortmess = vim.opt.shortmess + 'a' -- use abbreviations in messages eg. `[RO]` instead of `[readonly]`
vim.opt.shortmess = vim.opt.shortmess + 'c' -- completion messages
vim.opt.shortmess = vim.opt.shortmess + 'o' -- overwrite file-written messages
vim.opt.shortmess = vim.opt.shortmess + 't' -- truncate file messages at start
vim.opt.showbreak = '↳ ' -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.opt.showcmd = false -- don't show extra info at end of command line
vim.opt.sidescroll = 0 -- sidescroll in jumps because terminals are slow
vim.opt.sidescrolloff = 3 -- same as scrolloff, but for columns
vim.opt.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace

if root then
    vim.opt.shada = '' -- Don't create root-owned files.
    vim.opt.shadafile = 'NONE'
else
    vim.opt.shada = "'0,<0,f0,n~/.cache/nvim/shada"
end
if not vi then
    vim.opt.softtabstop = -1 -- use 'shiftwidth' for tab/bs at end of line
end

vim.opt.spellcapcheck = '' -- don't check for capital letters at start of sentence
vim.opt.splitbelow = true -- open horizontal splits below current window
vim.opt.splitright = true -- open vertical splits to the right of the current window
vim.opt.suffixes = vim.opt.suffixes - '.h' -- don't sort header files at lower priority
vim.opt.swapfile = false -- don't create swap files
vim.opt.switchbuf = 'usetab' -- try to reuse windows/tabs when switching buffers
vim.opt.synmaxcol = 200 -- don't bother syntax highlighting long lines
vim.opt.tabstop = 4 -- spaces per tab
vim.opt.termguicolors = true -- use guifg/guibg instead of ctermfg/ctermbg in terminal
-- vim.opt.textwidth = 80 -- automatically hard wrap at 80 columns
vim.opt.hidden = true

if root then
    vim.opt.undofile = false -- don't create root-owned files
else
    vim.opt.undodir = config .. '/undo//' -- keep undo files out of the way
    vim.opt.undodir = vim.opt.undodir + '.' -- fallback
    vim.opt.undofile = true -- actually use undo files
end

vim.opt.updatecount = 80 -- update swapfiles every 80 typed chars
vim.opt.updatetime = 500 -- CursorHold interval / Reduce time for highlighting other references
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.opt.viewdir = config .. '/view' -- where to store files for :mkview
vim.opt.viewoptions = 'cursor,folds' -- save/restore just these (with `:{mk,load}view`)
vim.opt.virtualedit = 'block' -- allow cursor to move where there is no text in visual block mode
vim.opt.visualbell = true -- stop annoying beeping for non-error errors
vim.opt.whichwrap = 'b,h,l,s,<,>,[,],~' -- allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
vim.opt.wildcharm = 26 -- ('<C-z>') substitute for 'wildchar' (<Tab>) in macros
vim.opt.wildignore = vim.opt.wildignore + '*.o,*.rej,*.so' -- patterns to ignore during file-navigation
vim.opt.wildmenu = true -- show options as list when switching buffers etc
vim.opt.wildmode = 'longest:full,full' -- shell-like autocomplete to unambiguous portion
vim.opt.winblend = 10 -- psuedo-transparency for floating windows
vim.opt.writebackup = false -- don't keep backups after writing

if vim.fn.filereadable('/usr/bin/python') == 1 then
    -- Avoid search, speeding up start-up.
    vim.g.python3_host_prog = '/usr/bin/python'
end

-- Neoformat
vim.g.neoformat_only_msg_on_error = 0
vim.g.neoformat_verbose = 0

-- NvimTree
-- vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', '*.un~', 'shada'}
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
