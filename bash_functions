# connect
# Creates or connect to a tmux session. Otherwise lists tmux sessions
function connect {
  [[ $1 -ne "" ]]
  if [ $# -eq 0 ]; then
    tmux ls
  else
    tmux new-session -A -s $1
  fi
}

# update-arch
# Takes the steps to update Arch linux
function update-arch {
  sudo -v
  sudo pacman -Syy && sudo pacman -Su
}

# Creates a timelapse given a FPS and filename
function create-timelapse {
  fps=$1
  filename=$2

  echo ffmpeg -pattern_type glob -i '*.JPG' -r $fps -s hd1080 -crf 18 -preset slow -vcodec libx264 $filename
  ffmpeg -pattern_type glob -i '*.JPG' -r $fps -s hd1080 -crf 18 -preset slow -vcodec libx264 $filename
}
