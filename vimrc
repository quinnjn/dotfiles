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
" Color scheme
Plugin 'srcery-colors/srcery-vim'

" Vundle teardown
call vundle#end()

" Colorscheme
colorscheme srcery

" Show line numbers
set number

" Make the background dark
set background=dark

" Syntax highlight
syntax on

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

" statusline
set fillchars=stl:―,stlnc:—,vert:│,fold:۰,diff:·

highlight folded       cterm=bold ctermbg=none ctermfg=5
highlight vertsplit    cterm=none ctermbg=none ctermfg=9
highlight statusline   cterm=none ctermbg=none ctermfg=9
highlight statuslinenc cterm=none ctermbg=none ctermfg=9
highlight specialkey   cterm=none ctermbg=none ctermfg=1
highlight matchparen   cterm=none ctermbg=none ctermfg=5
highlight wildmenu     cterm=bold ctermbg=none ctermfg=3
highlight visual       cterm=bold ctermbg=7    ctermfg=none
highlight user1        cterm=none ctermbg=none ctermfg=3

set statusline=
set statusline+=%1*%f%*
set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%)
set statusline+=%=
set statusline+=[%(%l,%c%V%)]
set statusline+=\ %1*%P%*
