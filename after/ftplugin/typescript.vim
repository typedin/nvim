augroup MyTypescriptCommands
  au!
  " autocmd BufWritePost <buffer> *.ts :silent! !prettier --write %
  autocmd BufWritePre *.ts Neoformat
augroup END

setlocal shiftwidth=2
