# ##!/bin/bash

# Detection of the os
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	OS=$(lsb_release -si)
	VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	OS=$DISTRIB_ID
	VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	OS=Debian
	VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
	# Older SuSE/etc.
	...
elif [ -f /etc/redhat-release ]; then
	# Older Red Hat, CentOS, etc.
	...
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	OS=$(uname -s)
	VER=$(uname -r)
fi

# Check for distribution and install accordingly
echo "Distribution '$OS' detected"

if grep -q "Fedora" <<<"$OS"; then
	sudo dnf install neovim
	INSTALL="dnf"
elif [[ "Ubuntu" == *"$OS" ]]; then
	INSTALL="apt-get"
	if type snap &>/dev/null; then
		sudo snap install neovim --classic
	else
		sudo apt-get install snapd
		sudo snap install neovim --classic
	fi
else
	echo "Distribution not handled, please install everything manually"
	exit 1
fi

if [ -n $INSTALL ]; then
	sudo $INSTALL update

	if [[ "Ubuntu" == *"$OS" ]]; then
		sudo $INSTALL upgrade -y
	fi

	sudo $INSTALL install git nodejs neovim ripgrep cmake fzf ripgrep gcc g++
else
	exit 1
fi

cp -r ~/.config/dotfiles/nvim/ ~/.config/

echo "PLEASE run the 'nvim' command now"
