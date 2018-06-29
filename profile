# RVM
if [[ -s "$HOME/.rvm/bin" ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Android Platform Tools
## OSX
if [[ -s "$HOME/Library/Android/sdk/platform-tools" ]]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
fi

# SDKMAN
if [[ -s "/home/quinnjn/.sdkman/bin/sdkman-init.sh" ]]; then
  export SDKMAN_DIR="/home/quinnjn/.sdkman"
  source "/home/quinnjn/.sdkman/bin/sdkman-init.sh"
fi 

export VISUAL="vim"
export EDITOR="$VISUAL"

# Disable bell
set bell-style none
