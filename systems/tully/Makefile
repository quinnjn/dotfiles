# Makefile for installing dotfiles
#
# This script will replace files found your home directory!!! Use discretion!

all: config x
	@echo '>>> all'

config_clean:
	@echo '>>> onfig_clean'
	rm -rf ~/.config

config_link:

	ln -sf `pwd`/config ~/.config

# Links config files to the users directory
config: config_clean config_link
	@echo '>>> config'

x_clean:
	@echo '>>> x_clean'

	rm -rf ~/.Xauthority
	rm -rf ~/.Xdefaults
	rm -rf ~/.Xmodmap
	rm -rf ~/.Xresources
	rm -rf ~/.xinitrc
	rm -rf ~/.xsession

x_link:
	@echo '>>> x_link'

	ln -sf `pwd`/X/authority ~/.Xauthority
	ln -sf `pwd`/X/defaults ~/.Xdefaults
	ln -sf `pwd`/X/modmap ~/.Xmodmap
	ln -sf `pwd`/X/resources ~/.Xresources
	ln -sf `pwd`/xinitrc ~/.xinitrc
	ln -sf `pwd`/xsession ~/.xsession
	ln -sf `pwd`/yaourtrc ~/.yaourtrc

x: x_clean x_link
	@echo '>>> x'
