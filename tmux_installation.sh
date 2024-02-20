##!/bin/bash

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
if [[ "Fedora" == *"$OS" ]]; then
	sudo dnf install tmux
elif [[ "Ubuntu" == *"$OS" ]]; then
	sudo apt-get install tmux
else
	echo "Tmux already installed, or distribution not handled"
fi

# Installaton of TPM
if [ -d ~/.tmux/plugins/tpm ]; then
	echo "tpm already installed"
else
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# import of personal config
if [ -d ~/.config/dotfiles ]; then
	echo "Dotfiles folder already exist"
else
	git clone https://www.github.com/cheurte/dotfiles ~/.config/dotfiles
fi

if [ ! -d ~/.config/tmux/ ]; then
	echo "please install tmux manually, automatic installation must have failed"
else
	cp ~/.config/dotfiles/tmux/tmux.conf ~/.config/tmux/
fi
