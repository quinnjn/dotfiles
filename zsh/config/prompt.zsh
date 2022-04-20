# vcs_info gives us version control status
autoload -Uz vcs_info

# Enable git
zstyle ':vcs_info:*' enable git

# Executed before each prompt
precmd() {
  # Update vcs info
  vcs_info
}

# Allow parameter expansion
setopt prompt_subst
# Asks vcs change status
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' formats " on %F{blue}%b [%m%u%c]%f"

prompt() {
  local prompt=""

  # Display current user
  prompt+="%{%F{red}%}%n%f"

  # Display current machine
  prompt+=" at "
  prompt+="%{%F{yellow}%}%m%f"

  # Display working directory
  prompt+=" in "
  prompt+="%{%F{green}%}%~%f"

  # Display git details
  prompt+='${vcs_info_msg_0_}'

  prompt+="\n"
  prompt+="$ "

  echo $prompt
}

PROMPT=$(prompt)
