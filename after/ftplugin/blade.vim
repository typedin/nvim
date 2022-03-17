augroup MyBladeCommands
  autocmd!
  autocmd BufWritePre *.blade.php silent! Neoformat
augroup END
setlocal shiftwidth=4


