-- vim.opt.guifont = "FiraCode Nerd Font:h17"
vim.opt.termguicolors = true
-- vim.opt.background = "dark"

-- vim.cmd 'colorscheme molokayo'
vim.g.nord_contrast = true
vim.g.nord_borders = false
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
