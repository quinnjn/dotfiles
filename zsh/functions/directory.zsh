# Change directory to dev folder
dev() {
  cd ~/git/github.com/quinnjn
}

# Change directory to dotfile folder
dotfiles() {
  cd ~/git/github.com/quinnjn/dotfiles
}

# Change directory to work folder
work() {
  cd ~/work/
}

# Make ls prettier
ls() {
  gls --group-directories-first --time-style=+"%Y-%m-%d %H:%M:%S" --color=auto "$@"
}
