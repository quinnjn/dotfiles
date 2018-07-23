#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin
export VISUAL=vim
export EDITOR=$VISUAL

source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_prompt
source ~/.profile

if [[ -s "/usr/share/nvm/init-nvm.sh" ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

# Initialize NVM if it exists
if [ -f "$HOME/.nvm"]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
