# update-arch
# Takes the steps to update Arch linux
function update-arch {
  sudo -v
  sudo pacman -Syy && sudo pacman -Su
}
