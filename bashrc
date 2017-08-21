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