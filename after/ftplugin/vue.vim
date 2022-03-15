augroup MyVueCommands
  au!
  " autocmd BufWritePost *.js :silent! !prettier --write %
  autocmd BufWritePost *.vue :silent! Prettier
  autocmd FileType vue syntax sync fromstart
augroup END

