# vcs_info gives us version control status
autoload -Uz vcs_info

# Enable git
zstyle ':vcs_info:*' enable git

# Executed before each prompt
precmd() {
  # Update vcs info
  vcs_info
}

work_prompt () {
  if [[ "$PWD" =~ ".*/work/.*" ]] && [[ -f ~/bin/work-prompt ]]; then
    echo $(~/bin/work-prompt)
  fi
}

precmd_functions+=(work_prompt)

# Allow parameter expansion
setopt prompt_subst
# Asks vcs change status

zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " on %F{blue}%b [%m%u%c]%f"
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

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
