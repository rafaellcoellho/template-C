#!/bin/bash

# Bash script that download and build cpputest inside the project tree,
# where project's Makefile will look for it.

cd ..
rm -rf cpputest
rm cpputest-3.8.tar.gz
wget https://github.com/cpputest/cpputest/releases/download/v3.8/cpputest-3.8.tar.gz
tar -xf cpputest-3.8.tar.gz
rm cpputest-3.8.tar.gz
mv cpputest-3.8 cpputest
cd cpputest
./autogen.sh
./configure
make all
