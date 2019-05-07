if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"

  # Load RVM into a shell session *as a function*
  source "$HOME/.rvm/scripts/rvm"
fi
