#!/bin/bash
set -eu

mkdir -p build
cd build

cmake \
  .. \
  -DENABLE_BITSHUFFLE_PLUGIN=no \
  -DENABLE_LZ4_PLUGIN=yes \
  -DENABLE_BZIP2_PLUGIN=no \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_INSTALL_PREFIX=$PREFIX
make install

mkdir -p $PREFIX/lib/hdf5/plugin
cp $PREFIX/lib/plugins/libh5lz4.so $PREFIX/lib/hdf5/plugin
