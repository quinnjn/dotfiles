" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" Vundle packages
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'udalov/kotlin-vim'
Plugin 'mtth/scratch.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rustushki/JavaImp.vim'

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
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2

" autoindent
set autoindent

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

" CtrlP Ignore Folders
set wildignore+=node_modules
set wildignore+=*/tmp/*
set wildignore+=*/log/*

" CtrlP Ignore Folders
set wildignore+=.git

"syntastic
source ~/.vim/syntastic.vim

"JavaImp
source ~/.vim/javaimp.vim
