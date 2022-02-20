"
" Filetype config
"
"
" this_is_a_word
"
augroup filetype_settings
    autocmd!
    autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab iskeyword+=$
augroup END
augroup framework_filetype_settings
    autocmd!
    autocmd BufRead,BufNewFile *.blade.php setlocal commentstring={{--\ %s\ --}} filetype=blade
augroup END
