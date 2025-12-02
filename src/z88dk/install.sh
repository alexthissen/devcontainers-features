#!/bin/sh
set -e

echo "Activating feature 'z88dk'"

export BUILD_SDCC=1
export BUILD_SDCC_HTTP=1
SOURCE_DIR=/usr/src
Z88DK=z88dk
TEMPDIR=$(mktemp -d)

# Clone z88dk repository
mkdir -p $SOURCE_DIR
cd $SOURCE_DIR
git clone --depth 1 --recursive https://github.com/z88dk/z88dk.git 
cd $Z88DK 

# Install dependencies
cp -p -R /var/lib/apt/lists $TEMPDIR
apt update -y
apt install -y bison flex libxml2-dev cpanminus libboost-all-dev perl ragel re2c ccache dos2unix texinfo texi2html libgmp3-dev libxml2-dev pkg-config 

# Install Perl modules
cpanm -l $HOME/perl5 --no-wget local::lib Template::Plugin::YAML
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
chmod 777 build.sh

# Build and install z88dk
./build.sh
make install PREFIX=/usr 

# Clean up
# apt remove --purge -y bison flex
# make install-clean bins-clean
# rm -rf /var/lib/apt/lists/*
# rm -r /var/lib/apt/lists && mv $TEMPDIR/lists /var/lib/apt/lists
# apt autoremove -y
# apt clean
unset BUILD_SDCC
unset BUILD_SDCC_HTTP
# rm -R $SOURCE_DIR/$Z88DK