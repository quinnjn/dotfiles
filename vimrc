" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" Vundle packages
Plugin 'gmarik/Vundle.vim'        " Plugin manager
Plugin 'scrooloose/nerdtree'      " Tree file explorer
Plugin 'tomtom/tcomment_vim'      " Comments out text depending on the file type
Plugin 'kien/ctrlp.vim'           " Fuzzy finder
Plugin 'vim-syntastic/syntastic'  " Syntax checker
Plugin 'mtth/scratch.vim'         " scratch window. gs to activate
Plugin 'tpope/vim-fugitive'       " Git wrapper in vim
Plugin 'srcery-colors/srcery-vim' " Color scheme

" Vundle teardown
call vundle#end()

" General settings
""""""""""""""""""
syntax on                     " Syntax highlight
set number                    " Show line numbers
filetype plugin indent on     " 2 space tabs
set expandtab                 " Converts tabs to spaces
set tabstop=2                 " How many spaces per tab
set shiftwidth=2              " How many spaces when re-indenting
set autoindent                " New lines inherit the indentation of previous lines.
set encoding=utf-8            " Encode files using UTF-8
set hlsearch                  " Highlight search terms

set fillchars=
set fillchars+=stl:―,    " status line of current window
set fillchars+=stlnc:—,  " status line of non-current window
set fillchars+=vert:│,   " vertical seperator for vsplit
set fillchars+=fold:۰,   " filling character
set fillchars+=diff:·,   " deleted lines in diff 

set statusline=
set statusline+=%1*%f%*
set statusline+=%(\ [%{fugitive#head()}%Y%R%W%M]%)
set statusline+=%=
set statusline+=[%(%l,%c%V%)]
set statusline+=\ %1*%P%*

" Color Scheme
""""""""""""""
colorscheme srcery                                                      " Colorscheme

highlight folded       cterm=bold ctermbg=none ctermfg=5
highlight vertsplit    cterm=none ctermbg=none ctermfg=9
highlight statusline   cterm=none ctermbg=none ctermfg=9
highlight statuslinenc cterm=none ctermbg=none ctermfg=9
highlight specialkey   cterm=none ctermbg=none ctermfg=1
highlight matchparen   cterm=none ctermbg=none ctermfg=5
highlight wildmenu     cterm=bold ctermbg=none ctermfg=3
highlight visual       cterm=bold ctermbg=7    ctermfg=none
highlight user1        cterm=none ctermbg=none ctermfg=3
highlight normal                  ctermbg=none              guibg=none  " Disable background color
highlight directory               ctermfg=Red                           " Colour NERDTree directory

" Mappings
"""""""""""""""""""
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>ff :CtrlP<CR>
map <silent> <LocalLeader>fr :CommandTFlush<CR>
map <silent> <LocalLeader>be :CtrlPBuffer<CR>

" Plugin settings
"""""""""""""""""""
set wildignore+=node_modules     " Ignore node_modules
set wildignore+=*/tmp/*          " Ignore tmp folders
set wildignore+=*/log/*          " Ignore log folders
set wildignore+=.git             " Ignore git folder

"syntastic
""""""""""
source ~/.vim/syntastic.vim
