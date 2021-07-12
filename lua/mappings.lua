-- /!\ mappings for compe are set in config/nvim-compe /!\
--Mappings.
local opts = { noremap = true, silent = true }

-- LuaFormatter off
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", opts )

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- show hide white spaces and indent blanklines
vim.api.nvim_set_keymap("n", "<Leader>l", ":set list! | :IndentBlanklineToggle<cr>", opts)

vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<cr>", opts) -- NvimTreeToggle

-- no hl
vim.api.nvim_set_keymap("n", "<Leader>h", ":set hlsearch!<CR>", opts)

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- scalpel
vim.cmd([[
  nmap <LocalLeader>e <Plug>(Scalpel)
]])

-- lspsaga
vim.api.nvim_set_keymap("n", "<LocalLeader>n", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.api.nvim_set_keymap("n", "<LocalLeader>p", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.api.nvim_set_keymap("n", "<LocalLeader>h", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.api.nvim_set_keymap("n", "<LocalLeader>s", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.api.nvim_set_keymap("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)

-- resizing
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
