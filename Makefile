# Makefile for installing dotfiles
#
# This script will replace files found your home directory!!! Use discretion!

all: bash scripts vim
	@echo '>>> all'

# Links bash files to the users directory
bash_link:
	@echo '>>> bash_link'

	ln -sf `pwd`/bash_aliases ~/.bash_aliases
	ln -sf `pwd`/bash_functions ~/.bash_functions
	ln -sf `pwd`/bash_profile ~/.bash_profile
	ln -sf `pwd`/bash_prompt ~/.bash_prompt
	ln -sf `pwd`/bashrc ~/.bashrc
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/vimrc ~/.vimrc
	ln -sf `pwd`/gitignore ~/.gitignore
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/profile ~/.profile
	ln -sf `pwd`/zshrc ~/.zshrc

bash: bash_link
	@echo '>>> bash'

# Cleans out the ~/bin directory
scripts_clean:
	@echo '>>> scripts_clean'

	rm -rf ~/bin

# Copies all files in bin to the users directory
scripts_copy:
	@echo '>>> scripts_copy'

	mkdir ~/bin
	cp -r bin/* ~/bin

scripts: scripts_clean scripts_copy
	@echo '>>> scripts'

# Removes the ~/.vim directory
vim_clean:
	@echo '>>> vim_clean'

	rm -rf ~/.vim

# Pulls vundle, installs vundle plugins
vim_build:
	@echo '>>> vim_build'

	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

vim: vim_clean vim_build
	@echo '>>> vim'