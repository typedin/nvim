" Background colors for active vs inactive windows
hi ActiveWindow guibg=#000000
hi InactiveWindow guibg=#252525
hi EndOfBuffer guifg=#000000

hi! VertSplit guibg=#252525 guifg=#252525

hi! Normal guibg=#000000 guifg=#ffffff ctermbg=234 ctermfg=15
hi LineNr ctermbg=NONE guibg=NONE
highlight Comment cterm=italic gui=italic


" @see: https://gist.github.com/ctaylo21/c3620a945cee6fc3eb3cb0d7f57faf00
" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction
"
" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

