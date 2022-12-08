#!/bin/bash

# Install pacman, makepkg, libalpm, and archlinux-keyring .debs from ubuntu 22.10

cd /tmp
curl -LO http://mirrors.kernel.org/ubuntu/pool/universe/p/pacman-package-manager/libalpm13_6.0.1-4_amd64.deb
curl -LO http://mirrors.kernel.org/ubuntu/pool/universe/a/archlinux-keyring/archlinux-keyring_0~20220727-2_all.deb
curl -LO http://mirrors.kernel.org/ubuntu/pool/universe/p/pacman-package-manager/pacman-package-manager_6.0.1-4_amd64.deb
curl -LO http://mirrors.kernel.org/ubuntu/pool/universe/p/pacman-package-manager/makepkg_6.0.1-4_amd64.deb
apt install -y ./*.deb
apt install libarchive-tools
