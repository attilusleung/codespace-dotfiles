#!/bin/bash

set -x

touch yeet

INSTALL=scripts

# Install packages
if apt -v; then
    sudo bash $INSTALL/apt-install.sh
elif pacman -V; then
    sudo bash $INSTALL/pacman-install.sh
fi

# Symlink .config
mkdir -p ~/.config
for f in config/*; do
    ln -s $(pwd)/$f ~/.config/$(basename $f)
done

# TODO: Shell specific scripts

# Hack because I can't be bothered to do this properly
echo "alias vim=nvim" >> ~/.bashrc
echo "alias vim=nvim" >> ~/.zshrc

# Install vim plugins
nvim --headless -c ":PlugInstall" -c ":qa!"
