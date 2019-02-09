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

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bas$_completion
