# Overwrite commands
if [[ "$OSTYPE" == "DARWIN" ]]; then
  alias ls='gls --group-directories-first --time-style=+"%Y-%m-%d %H:%M:%S" --color=auto "$@"'
else
  alias ls='ls --group-directories-first --time-style=+"%Y-%m-%d %H:%M:%S" --color=auto "$@"'
fi

alias vi=vim
alias pi="pacman -S"
alias g="git"
alias dev="cd ~/git/github.com/quinnjn"

alias lol='lutris lutris:rungame/league-of-legends'
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3 --metadata-from-title "%(artist)s - %(title)s" --add-metadata --audio-quality 0 -v'

# Reload bash
alias reload-bash="source ~/.bashrc"

# Git aliases
git config --global alias.co checkout
git config --global alias.st status

alias lol='lutris lutris:rungame/league-of-legends'
