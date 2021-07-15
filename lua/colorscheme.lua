-- vim.opt.guifont = "FiraCode Nerd Font:h17"
vim.opt.termguicolors = true
-- vim.opt.background = "dark"

-- vim.cmd 'colorscheme molokayo'
-- https://github.com/shaunsingh/nord.nvim
-- the following settings are overriden by the blur config file
vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = false
require('nord').set()

vim.cmd([[
  augroup BgHighlight
  autocmd!
      autocmd WinEnter * set cul
      autocmd WinLeave * set nocul
  augroup END
]])

vim.cmd([[
  au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]])
