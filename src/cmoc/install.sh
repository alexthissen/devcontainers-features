#!/bin/sh
set -e

# Installation instructions CMOC: http://sarrazip.com/dev/cmoc.html

echo "Activating feature 'cmoc'"
VERSION="${VERSION:-"0.1.97"}"
SOURCE_DIR=/usr/src
CMOC=cmoc-${VERSION}
mkdir -p $SOURCE_DIR

# Install dependencies for CMOC
apt update
apt install -y bison flex

# Install CMOC itself
cd $SOURCE_DIR
wget http://gvlsywt.cluster051.hosting.ovh.net/dev/$CMOC.tar.gz
tar -xvf $CMOC.tar.gz
rm $CMOC.tar.gz
cd $CMOC
./configure
make
make install

# Clean up
apt remove --purge -y bison flex
cd $SOURCE_DIR
rm -rf $CMOC