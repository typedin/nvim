local saga = require 'lspsaga'

-- custom colors: https://github.com/glepnir/lspsaga.nvim#colors
vim.cmd([[
  highlight link LspSagaFinderSelection Search
]])

saga.init_lsp_saga {}
