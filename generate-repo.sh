#!/bin/bash

# Generate a pacman repo using built packages

ROOTDIR=$(pwd)
REPO="eupnea"
ARCH="any"

mkdir -p repo-out/$REPO/os/$ARCH
cd repo-out/$REPO/os/$ARCH
cp -r $ROOTDIR/*.pkg.tar.zst .
repo-add ./$REPO.db.tar.gz *.pkg.tar.zst
