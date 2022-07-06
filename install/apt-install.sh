#!/bin/bash

# Ubuntu repo of neovim is stupidly outdated
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update

# Kitty terminfo for ssh
apt install -y kitty-terminfo
apt install -y neovim
