#!/bin/bash

set -x

touch yeet

INSTALL=install

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

echo "alias ls=ls --color" >> ~/.bashrc
echo "alias ls=ls --color" >> ~/.zshrc

# Install vim plugins
nvim --headless -c ":PlugInstall" -c ":qa!"
