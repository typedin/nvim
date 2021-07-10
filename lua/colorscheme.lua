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
  hi! VertSplit guibg=#OOOOOO guifg=#000000 ctermbg=233  ctermfg=233
  hi! Normal guibg=#000000 guifg=#ffffff ctermbg=234 ctermfg=15

  " Background colors for active vs inactive windows
  hi ActiveWindow guibg=#000000
  hi InactiveWindow guibg=#252525

  " Call method on window enter
  augroup WindowManagement
    autocmd!
    autocmd WinEnter * call Handle_Win_Enter()
  augroup END

  " Change highlight group of active/inactive windows
  function! Handle_Win_Enter()
    setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  endfunction
]])
