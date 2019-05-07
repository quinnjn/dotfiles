# Creates 2 timelapses in 60fps and 30fps
function sample-timelapse {
  ffmpeg -pattern_type glob -i '*.JPG' -r 30 -s hd1080 -crf 18 -preset slow -vcodec libx264 timelapse-30.mp4
  ffmpeg -pattern_type glob -i '*.JPG' -r 60 -s hd1080 -crf 18 -preset slow -vcodec libx264 timelapse-60.mp4
  vlc timelapse-30.mp4 timelapse-60.mp4
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
