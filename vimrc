" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" Vundle packages
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'

" Vundle teardown
call vundle#end()

" Show line numbers
set number

" Make the background dark
set background=dark

" Syntax highlight
syntax on

" Set a different theme
colorscheme zellner

" 2 space tabs
set expandtab
set tabstop=2
set softtabstop=2

" Encoding - Use UTF-8
set encoding=utf-8

" Highlight search terms
set hlsearch

" NERDTree
map \nt :NERDTreeToggle<CR>

" Colour NERDTree
highlight Directory ctermfg=Red

" TComment
map <silent> <LocalLeader>cc :TComment<CR>

" CtrlP
map <silent> <leader>ff :CtrlP<CR>
map <silent> <leader>fr :CommandTFlush<CR>
map <silent> <leader>be :CtrlPBuffer<CR>
