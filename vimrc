" vim-plug
call plug#begin('~/.vim/vim-plug')

Plug 'gmarik/Vundle.vim'        " Plugin manager
Plug 'scrooloose/nerdtree'      " Tree file explorer
Plug 'tomtom/tcomment_vim'      " Comments out text depending on the file type
Plug 'wincent/command-t', { 'do': 'make' }  " Fuzzy finder
Plug 'dense-analysis/ale'       " Linting
Plug 'mtth/scratch.vim'         " scratch window. gs to activate
Plug 'tpope/vim-fugitive'       " Git wrapper in vim
Plug 'srcery-colors/srcery-vim' " Color scheme
Plug 'artur-shaik/vim-javacomplete2'	" java completion for vim
Plug 'editorconfig/editorconfig-vim'  " EditorConfig
Plug 'leafgarland/typescript-vim' " Typescript syntax highlighting
Plug 'jparise/vim-graphql'        " GraphQL syntax highlighting
Plug 'ledger/vim-ledger'        " ledger plugin
Plug 'rhaiscript/vim-rhai'      " rhai syntax

Plug 'Vimjas/vim-python-pep8-indent' " Fix python indenting

" Conquer of Completion
Plug 'neoclide/coc.nvim'      ,{'branch': 'release'}
Plug 'neoclide/coc-json'      ,{'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver'  ,{'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer'

Plug 'github/copilot.vim'

call plug#end()

" General settings
""""""""""""""""""
syntax on                     " Syntax highlight

" Fix slow syntax highlighting
" See https://jameschambers.co.uk/vim-typescript-slow
set re=0

set number                    " Show line numbers
filetype plugin indent on     " 2 space tabs
set expandtab                 " Converts tabs to spaces
set tabstop=2                 " How many spaces per tab
set shiftwidth=2              " How many spaces when re-indenting
set autoindent                " New lines inherit the indentation of previous lines.
set encoding=utf-8            " Encode files using UTF-8
set hlsearch                  " Highlight search terms

set fillchars=
set fillchars+=stl:─,    " status line of current window
set fillchars+=stlnc:─,  " status line of non-current window
set fillchars+=vert:│,   " vertical seperator for vsplit
set fillchars+=fold:۰,   " filling character
set fillchars+=diff:·,   " deleted lines in diff

set statusline=
set statusline+=%1*%f%*                             " ?filename
set statusline+=%(\ [%{FugitiveHead()}%Y%R%W%M]%)  " [git head,filetype,readonly,preview window, modified]
set statusline+=%=                                  " fill between
set statusline+=[%(%l,%c%V%)]                       " [line, column]
set statusline+=\ %1*%P%*                           " file percentage

set directory=/tmp/vim/swap  " Swap files to tmp

" Center cursor when entering insert mode
autocmd InsertEnter * norm zz

" Autocomplete vim commands
set wildmode=longest,list,full

" Color Scheme
""""""""""""""
silent! colorscheme srcery                          " Colorscheme

highlight folded       cterm=BOLD ctermbg=NONE ctermfg=5
highlight vertsplit    cterm=NONE ctermbg=NONE ctermfg=9
highlight statusline   cterm=NONE ctermbg=NONE ctermfg=9
highlight statuslinenc cterm=NONE ctermbg=NONE ctermfg=9
highlight specialkey   cterm=NONE ctermbg=NONE ctermfg=1
highlight matchparen   cterm=NONE ctermbg=NONE ctermfg=5
highlight wildmenu     cterm=BOLD ctermbg=NONE ctermfg=3
highlight visual       cterm=BOLD ctermbg=7    ctermfg=NONE
highlight user1        cterm=NONE ctermbg=NONE ctermfg=3
highlight normal       cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE  " Disable background color
highlight directory    cterm=NONE ctermfg=Red                           " Colour NERDTree directory

" Mappings
"""""""""""""""""""
" NERDTree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>ff :CommandT<CR>
map <silent> <LocalLeader>fg :CommandTGit<CR>
map <silent> <LocalLeader>fr :CommandTFlush<CR>
map <silent> <LocalLeader>be :CommandTBuffer<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Enable spellcheck
map <LocalLeader>s :setlocal spell! spelllang=en_US

" Functions
"""""""""""
" Displays vim help, or coc hover
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" CommandT
"""""""""""""""""""
source ~/.vim/commandt.vim

" ALE
" """
source ~/.vim/ale.vim

" vim-javacomplete2
" """""""""""""""""
source ~/.vim/vim-javacomplete2.vim

" coc
" """
source ~/.vim/coc.vim
