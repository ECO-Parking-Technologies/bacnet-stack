#!/bin/sh

cd $(dirname $(readlink -f $0))

rm -rf eco_build
rm -rf lib
mkdir eco_build

options=" \
-DBACNET_STACK_BUILD_APPS=OFF \
-DBACNET_STACK_BUILD_TESTS=OFF \
-DBAC_ROUTING=OFF \
-DBACFILE=OFF \
-DBACNET_PROPERTY_LISTS=ON \
-DBACNET_BUILD_PIFACE_APP=OFF \
-DBACDL_ETHERNET=OFF \
-DBACDL_MSTP=OFF \
-DBACDL_ARCNET=OFF \
-DBACDL_BIP=ON \
-DBACDL_BIP6=OFF \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX="../lib"
"

cd eco_build
echo building with cmdline "cmake $options .."
cmake $options ..
make install
