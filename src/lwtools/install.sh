#!/bin/sh
set -e

# Installation instructions LWTools: http://www.lwtools.ca/

echo "Activating feature 'lwtools'"
VERSION="${VERSION:-"4.24"}"
SOURCE_DIR=/usr/src
LWTOOLS=lwtools-${VERSION}
mkdir -p $SOURCE_DIR

# Install LWTools
cd $SOURCE_DIR
wget http://www.lwtools.ca/releases/lwtools/$LWTOOLS.tar.gz
tar -xvf $LWTOOLS.tar.gz
rm $LWTOOLS.tar.gz
cd $LWTOOLS
make
make install

cd $SOURCE_DIR
rm -rf $LWTOOLS