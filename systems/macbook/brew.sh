#!/bin/bash

set -e
set -u
set -o pipefail

brew_installed=$(type brew &> /dev/null)

if [ ! brew_installed ]; then
  echo "Brew not installed."
  exit
fi

brew upgrade
brew upgrade --cask
brew list --formula > brew-formulas
brew list --cask > brew-casks
