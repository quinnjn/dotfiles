# Make ls look pretty
alias ls='gls --group-directories-first --time-style=+"%Y-%m-%d %H:%M:%S" --color=auto "$@"'
alias vi=vim
alias dev="cd ~/git/github.com/quinnjn"
alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3 --metadata-from-title "%(artist)s - %(title)s" --add-metadata --audio-quality 0 -v'

# Reload bash
alias reload-bash="source ~/.bashrc"
