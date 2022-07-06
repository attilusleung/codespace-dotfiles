#!/bin/bash

# I don't even know why you would use arch in a container, but whatever.

pacman --noconfirm -Syu
pacman --noconfirm -S kitty-terminfo
