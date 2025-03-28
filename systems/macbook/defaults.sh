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

# Dock settings

# Hide the dock
defaults write com.apple.dock autohide -bool true 
# Move the dock to the left
defaults write com.apple.dock orientation -string left 
# Remove apps from the Dock
defaults write com.apple.dock persistent-apps -array
# Set the dock to a certain tile size
defaults write com.apple.dock tilesize -int 36
# Restart the dock
killall Dock

# Restart
# -------

# Restart SystemUIServer.
killall SystemUIServer

# Make the default system appearance "Dark"
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
