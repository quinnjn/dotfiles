# Change default name "Screen Shot" to "screenshot"
defaults write com.apple.screencapture name "screenshot"
# Send screenshots to the desktop.
defaults write com.apple.screencapture location -string "$HOME/screenshots"
# Screenshots should be PNGs.
defaults write com.apple.screencapture type -string "png"
