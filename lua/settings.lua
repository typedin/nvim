vim.opt.encoding = "utf-8"
vim.opt.autoindent = true
vim.opt.expandtab = true 
vim.opt.hlsearch = true 

vim.opt.showcmd = false 
vim.opt.mouse = "a" -- Enable your mouse
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

vim.opt.scrolloff = 10 -- scrolling
vim.g.highlightedyank_highlight_duration = 100

vim.o.wrap = true
vim.o.linebreak = true
vim.o.cursorline = true

vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.syntax = "yes" 
vim.opt.backupcopy = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.backupdir = vim.fn.expand( '~/.config/nvim/backup//' )
vim.opt.backupdir = vim.opt.backupdir + '.'

-- folding
vim.opt.foldlevel = 1
vim.opt.foldlevelstart = 1

vim.o.completeopt = "menuone,noselect,noinsert"

-- listchars
vim.cmd("set backspace=indent,start,eol")
vim.cmd([[
	set listchars+=nbsp:⦸
	set listchars+=eol:↳ 
	set listchars+=tab:┅⊳
	set listchars+=extends:»
	set listchars+=precedes:«
	set listchars+=trail:•
	set modelines=5
]])
