" vim:foldmethod=marker

" Plugins {{{

    " unimpaired {{{

        " move single lines
        nmap <C-k> [e
        nmap <C-j> ]e
        " move visual selected lines
        vmap <C-k> [egv
        vmap <C-j> ]egv

    " }}}

    " vmath {{{
    
        vmap <expr> ++ VMATH_YankAndAnalyse()
        nmap        ++ vip++    
    
    " }}}

    " vimwiki {{{

        set nocompatible
        filetype plugin on
        syntax on
        let g:vimwiki_list = [{ 'path': '~/notes/' }]
        let g:vimwiki_folding = 'expr'

    " }}}

    " vim-markdown-folding {{{
        
        filetype plugin indent on
    
    " }}}

" }}}

" General Settings {{{

    let mapleader=","
    set number
    set relativenumber
    set cursorline

" }}}

" Keybindings {{{

    let mapleader=","
    " Open and close folds with Space
    nnoremap <space> za
    " When editing root-owned files as a user, provide :W to sudo-write the file
    command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" }}}

" Tabs'n'Spaces {{{

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" }}}

" Colorscheme {{{

    syntax on

    set t_Co=256
    colorscheme PaperColor
    set background=dark
    set laststatus=2

    " mark text going over a linelength of 80 in red
    highlight ColorColumn ctermfg=magenta ctermbg=none
    let &colorcolumn=join(range(81, 335), ',')

    "
    set hlsearch

    " exec "set listchars=trail:\uB7,nbsp:\uB7"
    " set list

" }}}

