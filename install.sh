#!/bin/bash

echo "Updating repositories and upgrading packages ..."

sleep 1

sudo apt-get update && sudo apt-get upgrade

echo "Installing Qt Creator tools and dependencies ..."

sleep 1

sudo apt-get -y install bison build-essential clang flex gperf \
libatspi2.0-dev libbluetooth-dev libclang-dev libcups2-dev libdrm-dev \
libegl1-mesa-dev libfontconfig1-dev libfreetype6-dev \
libgstreamer1.0-dev libhunspell-dev libnss3-dev libopengl-dev \
libpulse-dev libssl-dev libts-dev libx11-dev libx11-xcb-dev \
libxcb-glx0-dev libxcb-icccm4-dev libxcb-image0-dev \
libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev \
libxcb-shape0-dev libxcb-shm0-dev libxcb-sync-dev libxcb-util-dev \
libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb1-dev \
libxcomposite-dev libxcursor-dev libxdamage-dev libxext-dev \
libxfixes-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev \
libxkbfile-dev libxrandr-dev libxrender-dev libxshmfence-dev \
libxshmfence1 llvm ninja-build nodejs python3 python-is-python3 

echo "Downloading CMake 3.12.2 archive files ..."

sleep 1

wget https://github.com/Kitware/CMake/releases/download/v3.21.2/cmake-3.21.2.tar.gz

echo "Checking if cmake is installed ..."
sleep 1

if ! [ -x "$(command -v cmake)" ]; then
    echo "cmake is not installed ..."
    echo "Getting cmake 3.21.2 ..."
    sleep 1
    wget https://github.com/Kitware/CMake/releases/download/v3.21.2/cmake-3.21.2.tar.gz
fi

CMAKE_VERSION=$(cmake -version | head -1)
CMAKE_VERSION=$(echo $CMAKE_VERSION | cut -c 15-21)

if [ "$CMAKE_VERSION" != "3.21.2" ]; then
    echo "cmake is installed, but is not the correct version ..."
    echo "Getting cmake 3.21.2"
    sleep 1
    wget https://github.com/Kitware/CMake/releases/download/v3.21.2/cmake-3.21.2.tar.gz
    exit 1
fi

echo "Building CMake 3.12.2 ..."

sleep 1

tar xf cmake-3.21.2.tar.gz
cd cmake-3.21.2
./configure
make
sudo make install
cd ..
rm -rf cmake-3.21.2

echo "Downloading Qt Creator archive files ... "

sleep 1

wget https://download.qt.io/official_releases/qt/6.2/6.2.3/single/qt-everywhere-src-6.2.3.tar.xz


echo "Building Qt6 ..."

sleep 1

tar xf qt-everywhere-src-6.2.0.tar.xz
cd qt-everywhere-src-6.2.0
./configure -prefix /usr/local/Qt6

cmake --build .
sudo cmake --install .
cmake --build . --target docs
sudo cmake --build . --target install_docs

cd ..
rm -rf 

echo "Everything has downloaded. Congratulations!!!"