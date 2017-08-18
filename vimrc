" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" Vundle packages
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'

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

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='eslint'
