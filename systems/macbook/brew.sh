#!/bin/bash

set -e
set -u
set -o pipefail

brew_installed=$(type brew &> /dev/null)

if [ brew_installed ]; then
  brew upgrade
  brew cask upgrade
fi