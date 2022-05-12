# Improved brew
# Upgrade and dump current bundles before running command
brew() {
  command brew upgrade
  command brew upgrade --cask
  command brew bundle --force dump
  command brew bundle --force cleanup
}
