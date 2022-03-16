augroup MyJavascriptCommands
  au!
  autocmd BufWritePost *.js :silent! !prettier --write %
augroup END

setlocal shiftwidth=2
