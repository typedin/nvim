local opts= {
  noremap = true, 
  silent = true 
}
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-r>", ":Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-t>", ":Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<cr>", opts)

local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

