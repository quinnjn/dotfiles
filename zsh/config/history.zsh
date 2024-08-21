# Unlimited history size
export HISTFILESIZE=

# Unlimited history size
export HISTSIZE=

# Set the history file
export HISTFILE=~/.zsh_history

# Include timestamp in history
export HISTTIMEFORMAT="[%F %T] "

# Don't get duplicate commands
setopt HIST_FIND_NO_DUPS

# Don't write duplicate commands in the history file
setopt HIST_IGNORE_ALL_DUPS

# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
