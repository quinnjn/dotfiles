#!/bin/bash

# symlink dotfiles
ln -s $(pwd)/bash_aliases ~/.bash_aliases
ln -s $(pwd)/bash_functions ~/.bash_functions
ln -s $(pwd)/bash_profile ~/.bash_profile
ln -s $(pwd)/bash_prompt ~/.bash_prompt
ln -s $(pwd)/bashrc ~/.bashrc
ln -s $(pwd)/tmux.conf ~/.tmux.conf
ln -s $(pwd)/vimrc ~/.vimrc

# create .bin directory
rm -rf ~/bin
mkdir ~/bin
cp -r bin/* ~/bin

# setup vim
rm -rf ~/.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
