#!/bin/bash

set -e
set -u
set -o pipefail

# Screenshots
# -----------

# Change default name "Screen Shot" to "screenshot"
defaults write com.apple.screencapture name "screenshot"
# Send screenshots to the desktop.
defaults write com.apple.screencapture location -string "$HOME/Desktop"
# Screenshots should be PNGs.
defaults write com.apple.screencapture type -string "png"

# Restart
# -------

# Restart SystemUIServer.
killall SystemUIServer
