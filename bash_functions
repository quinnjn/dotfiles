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

  if [ -z "$2" ]; then
    filename="timelapse-$1.mp4"
  else
    filename=$2
  fi

  echo ffmpeg -pattern_type glob -i '*.JPG' -r $fps -s hd1080 -crf 18 -preset slow -vcodec libx264 $filename
  ffmpeg -pattern_type glob -i '*.JPG' -r $fps -s hd1080 -crf 18 -preset slow -vcodec libx264 $filename
}

# Without arguments goes to the dev folder
# With arguments, cds into that repo if it exists in the dev folder or clones it
function git-repo {
  org=$1
  repo=$2

  dev
  cd ..
  cd $org/$repo || git clone git@github.com:$org/$repo.git $org/$repo && cd $org/$repo
}
