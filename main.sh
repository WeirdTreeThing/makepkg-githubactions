#!/bin/bash

# Generate package and create repo for it

sudo bash setup-pacman.sh
makepkg -s
bash generate-repo.sh
