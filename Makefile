# Makefile for installing dotfiles
#
# This script will replace files found your home directory!!! Use discretion!

UNAME := $(shell uname)
FF_PROFILE_DIR := ~/Library/Application\ Support/Firefox/Profiles

all: clean profile zsh git scripts vim tmux system config
	@echo '=> all'

# Codespaces specific steps
bootstrap_codespaces: clean profile zsh git scripts tmux config
	@echo '=> codespaces'

profile_link:
	@echo '=> profile_link'
	ln -sf `pwd`/profile ~/.profile

profile: profile_link
	@echo '=> profile'

zsh_clean:
	@echo '=> zsh_clean'
	mkdir -p ~/zsh
	rm -rf ~/zsh/config
	rm -rf ~/zsh/aliases
	rm -rf ~/zsh/functions

zsh_copy:
	@echo '=> zsh_copy'
	cp -r zsh/config ~/zsh/config
	cp -r zsh/aliases ~/zsh/aliases
	cp -r zsh/functions ~/zsh/functions

zsh_link:
	@echo '=> zsh_clean'
	ln -sf `pwd`/zshrc ~/.zshrc
	ln -sf `pwd`/zshenv ~/.zshenv

zsh: zsh_clean zsh_copy zsh_link
	@echo '=> zsh'

git_link:
	@echo '=> git_link'
	ln -sf `pwd`/gitignore ~/.gitignore
	ln -sf `pwd`/gitconfig.personal ~/.gitconfig.personal

git: git_link
	@echo '=> git'
	# Git wants to rewrite ~ to the direct path
	# copying this file to location will ignore
	# that rewrite.
	(cp -r `pwd`/gitconfig ~/.gitconfig || :)

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

nvim_clean:
	@echo '=> nvim_clean'

	rm -rf ~/.config/nvim/pack
	rm -r ~/.config/nvim

vim_link:
	@echo '=> vim_link'
	ln -sf `pwd`/vimrc ~/.vimrc

# Pulls vundle, installs vundle plugins
vim_build:
	@echo '=> vim_build'

	mkdir -p /tmp/vim/swap # Swap folder
	mkdir -p ~/.vim
	cp -r vim/* ~/.vim

nvim_build:
	@echo '=> nvim_build'

	mkdir -p ~/.config/nvim
	cp -r config/nvim/* ~/.config/nvim

vim_install:
	@echo '=> vim_install'

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +'Copilot setup' +qall

vim: vim_link vim_build vim_install
	@echo '=> vim'
nvim: nvim_clean nvim_build
	@echo '=> nvim'

# System based steps
system:
ifeq ($(UNAME),Darwin)
	@echo '=> macbook system scripts'
	./systems/macbook/defaults.sh

brew:
	./systems/macbook/brew.sh
endif

config: config_clean config_link

config_clean:
	@echo '=> config_clean'

	rm -rf ~/.config/iterm2
	rm -rf ~/.config/notify
	rm -rf ~/.config/nvim

config_link: firefox_config_install
	@echo '=> config_link'

	cp -r config/iterm2 ~/.config/iterm2
	cp -r config/notify ~/.config/notify
	cp -r config/nvim ~/.config/nvim

	mkdir -p $(FF_PROFILE_DIR)/chrome
	cp -r config/firefox/userChrome.css $(FF_PROFILE_DIR)/chrome/userChrome.css

firefox_config_install:
	for folder in $(FF_PROFILE_DIR)/*; do \
		mkdir -p "$$folder/chrome"; \
		cp -r config/firefox/userChrome.css "$$folder/chrome/userChrome.css"; \
	done

clean: vim_clean
