autocmd FileType java setlocal omnifunc=javacomplete#Complete

" More configurations can be found on the github page
" https://github.com/artur-shaik/vim-javacomplete2

nmap <LocalLeader>jI <Plug>(JavaComplete-Imports-AddMissing)    " Add missing imports
nmap <LocalLeader>jR <Plug>(JavaComplete-Imports-RemoveUnused)  " Remove unused imports
nmap <LocalLeader>ji <Plug>(JavaComplete-Imports-AddSmart)      " Smart add all imports
nmap <LocalLeader>jii <Plug>(JavaComplete-Imports-Add)          " Adds the import under the cursor, or before it.

let g:JavaComplete_ImportSortType = 'packageName' " Sort imports by package name
