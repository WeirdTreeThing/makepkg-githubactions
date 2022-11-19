#!/bin/bash

set -e
set -x

cd /home/arch
PACKAGE=neofetch-btw
git clone https://aur.archlinux.org/$PACKAGE.git
cd $PACKAGE
makepkg -s --noconfirm
cp *.pkg.tar.zst ..
