-- /!\ mappings for compe are set in config/nvim-compe /!\
--Mappings.
local opts = { noremap=true, silent=true }

-- LuaFormatter off
vim.api
    .nvim_set_keymap("n", "<Space>", "<NOP>", opts )

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- show hide white spaces and indent blanklines
vim.api.nvim_set_keymap("n", "<Leader>l", ":set list! | :IndentBlanklineToggle<cr>", opts)

vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<cr>", opts)

-- no hl
vim.api.nvim_set_keymap("n", "<Leader>h", ":set hlsearch!<CR>", opts)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- scalpel
vim.cmd([[
	nmap <LocalLeader>e <Plug>(Scalpel)
]])

