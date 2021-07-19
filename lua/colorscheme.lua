vim.opt.termguicolors = true
vim.opt.background = "dark"
-- https://github.com/shaunsingh/nord.nvim
-- the following settings are overriden in after/plugin/color.vim
vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = true
require('nord').set()

vim.cmd([[
  augroup BgHighlight
  autocmd!
      autocmd WinEnter * set cul
      autocmd WinLeave * set nocul
  augroup END
]])

-- don't show lualine in NvimTree
vim.cmd([[
  au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]])
