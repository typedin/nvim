-- /!\ mappings for compe are set in config/nvim-compe /!\
-- LuaFormatter off
vim.api
    .nvim_set_keymap("n", "<Space>", "<NOP>", {noremap = true, silent = true})

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- show hide white spaces and indent blanklines
vim.api.nvim_set_keymap("n", "<Leader>l",
                        ":set list! | :IndentBlanklineToggle<cr>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<cr>",
                        {noremap = true, silent = true})

-- no hl
vim.api.nvim_set_keymap("n", "<Leader>h", ":set hlsearch!<CR>",
                        {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv",
                        {noremap = true, silent = true})

-- scalpel
vim.cmd([[
	nmap <LocalLeader>e <Plug>(Scalpel)
]])

