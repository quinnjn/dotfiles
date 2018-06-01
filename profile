
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/quinnjn/.sdkman"
[[ -s "/home/quinnjn/.sdkman/bin/sdkman-init.sh" ]] && source "/home/quinnjn/.sdkman/bin/sdkman-init.sh"

export VISUAL="vim"
export EDITOR="$VISUAL"

# Disable bell
set bell-style none

# Android Platform Tools
## OSX
if [[ -s "$HOME/Library/Android/sdk/platform-tools" ]]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
fi
