if [[ "$(type -p brew)" == "brew not found" ]]; then
  # brew is not installed. Skip this section.
  return
fi

if [[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
fi
if [[ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi
