[[ -f ~/.bashrc ]] && . ~/.bashrc

## RVM
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Git
git config --global core.excludesfile ~/.gitignore

if [ -z "$SSH_CONNECTION" ]; then
  ## Local connections
  if [ -x "$(command -v startx)" ] && [ -z "$DISPLAY" ]; then
    exec startx
  fi
fi

