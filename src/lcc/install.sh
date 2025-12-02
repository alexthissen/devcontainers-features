#!/bin/sh
set -e

# Installation instructions LWTools: http://www.lwtools.ca/

echo "Activating feature 'lwtools'"
VERSION="${VERSION:-"4.24"}"
SOURCE_DIR=/usr/src
mkdir -p $SOURCE_DIR

# Install LCC1802
cd $SOURCE_DIR
git clone https://github.com/bill2009/lcc1802.git
cd lcc1802/lcc42
mkdir build
make BUILDDIR=build all
install lcc /usr/local/bin
install rcc /usr/local/bin
install copt /usr/local/bin

# Clean up
cd $SOURCE_DIR
rm -rf lcc1802