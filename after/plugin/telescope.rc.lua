local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<C-g>", ":Telescope live_grep<cr>", opts) -- disable for now collision with default mapping
vim.api.nvim_set_keymap("n", "<C-t>", ":Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<cr>", opts)

local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup {
    defaults = {mappings = {n = {["q"] = actions.close}}}
}

