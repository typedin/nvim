require("plugins")
require("lsp")
require("colorscheme")
require("settings")

vim.cmd([[
        " stop loading config if it's on tiny or small
        if !1 | finish | endif

        set nocompatible
        set number
        set relativenumber
        syntax enable
        set fileencodings=utf-8,sjis,euc-jp,latin
        set encoding=utf-8
        set title
        set autoindent
        set background=dark
        set nobackup
        set hlsearch
        set showcmd
        set cmdheight=1
        set laststatus=2
        set scrolloff=10
        set expandtab
        "let loaded_matchparen = 1
        set shell=zsh
        set backupskip=/tmp/*,/private/tmp/*
]])

vim.cmd([[
" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}
]])

vim.cmd([[
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
]])

require("mappings")-- should be a good idea to move all plugin bindings into this file
