[[ -f ~/.bashrc ]] && . ~/.bashrc

## RVM
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Git
git config --global core.excludesfile ~/.gitignore

