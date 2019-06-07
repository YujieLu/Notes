#!/bin/bash
# install protobuf

# check the install path
set -o errexit  # stop execution on error

given_file=$1 # retrieve input parameter and populate a variable

if [ -f given_file  ]; then
     cd given_file
else
    echo Usage: ./protobuf_install.bash [install_path]
fi


# install dependency
sudo apt-get install autoconf automake libtool curl make g++ unzip

# get the source
cd $1
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
git submodule update --init --recursive
./autogen.sh

#build and install
./configure
make
make check
sudo make install
sudo ldconfig # refresh shared library cache.

echo All Done!
