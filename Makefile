# Makefile for installing dotfiles
#
# This script will replace files found your home directory!!! Use discretion!

UNAME := $(shell uname)

all: bash scripts vim tmux system configs
	@echo '=> all'

bash_clean:
	@echo '=> bash_clean'

	rm -rf ~/bash/aliases
	rm -rf ~/bash/functions
	rm -rf ~/bash/profile

bash_copy:
	@echo '=> bash_copy'

	mkdir -p ~/bash
	cp -r bash/aliases ~/bash/
	cp -r bash/functions ~/bash/
	cp -r bash/profile ~/bash/

# Links bash files to the users directory
bash_link:
	@echo '=> bash_link'

	ln -sf `pwd`/bash_aliases ~/.bash_aliases
	ln -sf `pwd`/bash_functions ~/.bash_functions
	ln -sf `pwd`/bash_profile ~/.bash_profile
	ln -sf `pwd`/bash_prompt ~/.bash_prompt
	ln -sf `pwd`/bashrc ~/.bashrc
	ln -sf `pwd`/vimrc ~/.vimrc
	ln -sf `pwd`/gitignore ~/.gitignore
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/profile ~/.profile
	ln -sf `pwd`/zshrc ~/.zshrc

bash: bash_clean bash_copy bash_link
	@echo '=> bash'

# Cleans out the ~/bin directory
scripts_clean:
	@echo '=> scripts_clean'

	rm -rf ~/bin

# Copies all files in bin to the users directory
scripts_copy:
	@echo '=> scripts_copy'

	mkdir -p ~/bin
	cp -r bin/* ~/bin

scripts: scripts_clean scripts_copy
	@echo '=> scripts'

tmux_copy:
	@echo '=> tmux_copy'

	ln -sf `pwd`/tmux.conf ~/.tmux.conf

tmux: tmux_copy
	@echo '=> tmux'

# Removes the ~/.vim directory
vim_clean:
	@echo '=> vim_clean'

	rm -rf ~/.vim

# Pulls vundle, installs vundle plugins
vim_build:
	@echo '=> vim_build'

	mkdir ~/.vim
	cp -r vim/* ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall

vim: vim_clean vim_build
	@echo '=> vim'

# System based steps
system:
ifeq ($(UNAME),Darwin)
	@echo '=> macbook system scripts'
	./systems/macbook/defaults.sh
	ln -sf `pwd`/systems/macbook/sleepwatcher/sleep ~/.sleep
	ln -sf `pwd`/systems/macbook/sleepwatcher/wake ~/.wake
	ln -sf `pwd`/systems/macbook/bitbar ~/Library/Application\ Support/xbar/plugins 

brew:
	./systems/macbook/brew.sh
endif

configs: templates

templates: templates_clean templates_link

templates_clean:
	@echo '=> templates_clean'

	rm -rf ~/.templates
	
templates_link:
	@echo '=> templates_link'

	cp -r templates ~/.templates
