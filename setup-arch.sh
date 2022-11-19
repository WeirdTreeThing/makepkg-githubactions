#!/bin/bash

set -e
set -x

sudo apt install -y arch-install-scripts
sudo cp build-packages.sh /tmp
cd /tmp
sudo wget https://geo.mirror.pkgbuild.com/iso/latest/archlinux-bootstrap-x86_64.tar.gz
sudo mkdir -p /mnt/arch
sudo mkdir -p /tmp/arch-fs
sudo mount --bind /mnt/arch /mnt/arch
sudo tar xf /tmp/archlinux-bootstrap-x86_64.tar.gz -C /tmp/arch-fs
sudo cp -r /tmp/arch-fs/root.x86_64/* /mnt/arch/
sudo arch-chroot /mnt/arch /usr/bin/useradd -m arch
sudo arch-chroot /mnt/arch /usr/bin/pacman-key --init
sudo arch-chroot /mnt/arch /usr/bin/pacman-key --populate archlinux
sudo su - root -c "echo 'Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch' > /mnt/arch/etc/pacman.d/mirrorlist"
sudo su - root -c "echo 'arch ALL=(ALL) NOPASSWD: ALL' > /mnt/arch/etc/sudoers"
sudo sed -i 's/CheckSpace/\#CheckSpace/g' /mnt/arch/etc/pacman.conf
sudo arch-chroot /mnt/arch /usr/bin/pacman -Syu --noconfirm
sudo arch-chroot /mnt/arch /usr/bin/pacman -S base base-devel git --noconfirm
sudo cp build-packages.sh /mnt/arch/home/arch/
sudo chmod a+x /mnt/arch/home/arch/build-packages.sh
sudo chown 1000:1000 /mnt/arch/home/arch/build-packages.sh
sudo arch-chroot -u arch /mnt/arch "/home/arch/build-packages.sh"
mkdir ~/built-packages
cd ~/built-packages
sudo cp -r /mnt/arch/home/arch/*.pkg.tar.zst .
