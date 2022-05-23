google_cloud() {
  local google_cloud_dir=/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk

  if [[ -f $google_cloud_dir/completion.zsh.inc ]]; then
    source $google_cloud_dir/completion.zsh.inc
  fi

  if [[ -f $google_cloud_dir/path.zsh.inc ]]; then
    source $google_cloud_dir/path.zsh.inc
  fi
}

google_cloud
