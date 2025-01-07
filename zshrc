PROFILING=false

# Start profiling if enabled
function start_profiling {
  if [[ "$PROFILING" == "true" ]]; then
    zmodload zsh/zprof
  fi
}

# Stop profiling if enabled
function stop_profiling {
  if [[ "$PROFILING" == "true" ]]; then
    zprof
  fi
}

start_profiling

# Bring in all our config
for config in ~/zsh/config/*; do
  source $config
done

# Bring in all our aliases
for alias in ~/zsh/aliases/*; do
  source $alias
done

# Bring in all our functions
for function in ~/zsh/functions/*; do
  source $function
done

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

stop_profiling
