augroup MyJavascriptCommands
  au!
  " autocmd BufWritePost *.js :silent! !prettier --write %
  autocmd BufWritePre *.js Neoformat
augroup END

setlocal shiftwidth=2
