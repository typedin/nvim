vim.opt.guifont = "FiraCode Nerd Font:h17"
vim.opt.termguicolors = true

vim.cmd([[
  colorscheme molokayo
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
  set cursorline
  augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
  augroup END
  set background=dark
  syntax enable
  set winblend=0
  set wildoptions=pum
  set pumblend=5
]])
