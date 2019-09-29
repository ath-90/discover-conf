#!/bin/bash

export PATH=/home/ath/raspberrypi/tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin:$PATH

arch="arm-bcm2708hardfp-linux-gnueabi"

export AR="${arch}-ar"
export AS="${arch}-as"
export LD="${arch}-ld"
export CC="${arch}-cc"
export CXX="${arch}-c++"
export RANLIB="${arch}-ranlib"

export CFLAGS="-O2 -std=gnu99 -I/home/ath/raspberrypi/rootfs/usr/include -L/home/ath/raspberrypi/rootfs/lib"
export CXXFLAGS="-O2 -g -std=c++11"
export LDFLAGS="-Wl,-rpath=/home/ath/raspberrypi/rootfs/lib"
export PKG_CONFIG_PATH=~/raspberrypi/rootfs/lib/pkgconfig

./waf configure --prefix=/home/ath/raspberrypi --boost-includes=/home/ath/raspberrypi/rootfs/usr/include --boost-libs=/home/ath/raspberrypi/lib --with-openssl=/home/ath/raspberrypi/rootfs --with-cryptopp=/home/ath/raspberrypi/rootfs

if [ $? = 0 ]
then
    ./waf clean
    ./waf
fi
