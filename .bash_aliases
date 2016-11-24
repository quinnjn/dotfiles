alias ls="ls --color=auto"
alias vi=vim
alias pi="pacman -S"

# Git aliases
git config --global alias.co checkout
git config --global alias.st status

alias dev="tmux attach -t dev || tmux new -s dev"
