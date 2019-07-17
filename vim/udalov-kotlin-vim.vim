" There is some bug with this plugin
" when installing with Vundle where
" the syntax highlighting doesn't work.
"
" https://github.com/udalov/kotlin-vim/issues/13
"
" To get around it, lets just copy the
" syntax highlighting from the plugin
"
" https://github.com/udalov/kotlin-vim/blob/master/ftdetect/kotlin.vim
autocmd BufNewFile,BufRead *.kt setfiletype kotlin
autocmd BufNewFile,BufRead *.kts setfiletype kotlin
