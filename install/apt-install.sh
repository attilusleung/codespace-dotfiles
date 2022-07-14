#!/bin/bash

# Ubuntu repo of neovim is stupidly outdated
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.deb
dpkg -i nvim-linux64.deb

# Kitty terminfo for ssh
apt update && apt upgrade
apt install -y kitty-terminfo
