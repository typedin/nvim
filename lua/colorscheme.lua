-- the following settings are overriden in after/plugin/color.vim
vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_contrast_dark = "hard" -- or "light" for light mode

vim.cmd([[colorscheme gruvbox]])

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
