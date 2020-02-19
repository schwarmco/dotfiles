" vim:foldmethod=marker

set nocompatible
filetype off

" Plugins {{{

    " install vim-plug if not already installed
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
    endif

    call plug#begin('~/.vim/plugged')

    Plug 'vimwiki/vimwiki'
    filetype plugin on
    syntax on
    let g:vimwiki_list = [{ 'path': '~/notes/' }]
    let g:vimwiki_folding = 'expr'

    Plug '~/.config/fzf'
    Plug 'junegunn/fzf.vim'
    map <C-p> :Files<CR>

    Plug 'terryma/vim-multiple-cursors'

    Plug 'easymotion/vim-easymotion'

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

    " vim-markdown-folding {{{
        
        filetype plugin indent on
    
    " }}}
    
    call plug#end()

" }}}

" General Settings {{{

    let mapleader=","
    set number
    set relativenumber
    set cursorline

" }}}

" Keybindings {{{

    " Open and close folds with Space
    nnoremap <space> za
    " When editing root-owned files as a user, provide :W to sudo-write the file
    command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" }}}

" Tabs'n'Spaces {{{{{{}}}

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
    " highlight ColorColumn ctermfg=magenta ctermbg=none
    " let &colorcolumn=join(range(81, 335), ',')

    "
    set hlsearch

    " exec "set listchars=trail:\uB7,nbsp:\uB7"
    " set list

" }}}

