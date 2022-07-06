#!/bin/bash

# Install packages
if [[ apt -v ]] then
    bash install/apt-install.sh
elif [[ pacman -v ]] then
    bash install/pacman-install.sh
fi

# Symlink .config
for f in config/*; do
    ln -s $f "~/.config/$(basename $f)"
done

# TODO: Shell specific scripts

# Hack because I can't be bothered to do this properly
echo "alias vim=nvim" >> ~/.bashrc
echo "alias vim=nvim" >> ~/.zshrc

# Install vim plugins
nvim -c ":PlugInstall" -c ":qa!"
