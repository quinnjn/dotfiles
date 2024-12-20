bindkey -v
bindkey "^R" history-incremental-search-backward

zle -N edit-command-line
bindkey '^X^E' edit-command-line
