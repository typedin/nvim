vim.opt.guifont = "FiraCode Nerd Font:h17"
vim.opt.termguicolors = true
vim.opt.background = "dark" 

vim.cmd 'hi LineNr ctermbg=NONE guibg=NONE'
vim.cmd 'colorscheme molokayo'

vim.cmd([[
  augroup BgHighlight
  autocmd!
          autocmd WinEnter * set cul
          autocmd WinLeave * set nocul
  augroup END
]])
