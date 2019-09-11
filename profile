#!/bin/bash

function ironborn {
  # Disable bell
  set bell-style none
}

# RVM
if [[ -s "$HOME/.rvm/bin" ]]; then
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Android
## OSX
if [[ -s "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"
  export PATH="$PATH:$ANDROID_HOME/tools"
fi

# SDKMAN
if [[ -s "/home/quinnjn/.sdkman/bin/sdkman-init.sh" ]]; then
  export SDKMAN_DIR="/home/quinnjn/.sdkman"
  source "/home/quinnjn/.sdkman/bin/sdkman-init.sh"
fi 

source ~/bash/profile/debian.sh

export VISUAL="vim"
export EDITOR="$VISUAL"

if [[ "$(hostname)" -eq "ironborn" ]]; then
  ironborn
fi

ssh-add &> /dev/null
