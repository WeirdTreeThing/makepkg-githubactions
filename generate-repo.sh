#!/bin/bash

# Generate a pacman repo using built packages

ROOTDIR=$(pwd)
REPO="eupnea"
ARCH="any"

mkdir -p repo-out/$REPO/os/$ARCH
cd repo-out/$REPO/os/$ARCH
cp -r $ROOTDIR/*.pkg.tar.gz .
repo-add ./$REPO.db.tar.gz *.pkg.tar.gz
