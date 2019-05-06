if [[ "$OSTYPE" != *"darwin"* ]]; then
  return 1
fi

# Sometimes my macbooks audio makes a clicking noise. Running this command resets it.
alias fix-audio='sudo killall coreaudiod'

# OSX has gls to color output
alias ls='gls --group-directories-first --time-style=+"%Y-%m-%d %H:%M:%S" --color=auto "$@"'
