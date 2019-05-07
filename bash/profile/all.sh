[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$SSH_CONNECTION" ]; then
  ## Local connections
  if [ -x "$(command -v startx)" ] && [ -z "$DISPLAY" ]; then
    exec startx
  fi
fi

