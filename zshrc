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

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
