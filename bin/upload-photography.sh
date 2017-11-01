#!/bin/bash

set -e
set -u
set -o pipefail

function rsync_move {
  src="$1"
  dest="$2"

  rsync --ignore-existing --verbose --compress --progress --archive --remove-source-files $src $dest
}

function braavos_move {
  src=$1
  dest="braavos:/media/stor/raw/$1"

  echo "Moving from ($src) to ($dest)"
  rsync_move $src $dest
}

