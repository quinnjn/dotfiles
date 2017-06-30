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

" Pathogen
execute pathogen#infect()

" NERDTree
map \nt :NERDTreeToggle<CR>
" Colour NERDTree
highlight Directory ctermfg=Red
