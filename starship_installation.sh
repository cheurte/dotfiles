##!/bin/bash

curl -sS https://starship.rs/install.sh | sh

echo "eval '$(starship init bash)'" >>~/.bashrc

source ~/.bashrc

cp ~/.config/dotfiles/starship/starship.toml ~/.config/
