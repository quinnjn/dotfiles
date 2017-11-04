
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/quinnjn/.sdkman"
[[ -s "/home/quinnjn/.sdkman/bin/sdkman-init.sh" ]] && source "/home/quinnjn/.sdkman/bin/sdkman-init.sh"
