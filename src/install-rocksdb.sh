#!/bin/bash
#
# Script for container to install rocksdb for production use and not for testing
# as docker build would slow down testing 

apt-get -y update \
    && apt-get install -y --no-install-recommends wget make build-essential checkinstall libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

mkdir /build \
    && cd /build \
    && git clone https://github.com/facebook/rocksdb.git \
    && cd rocksdb \
    && git checkout v5.14.2 \
    && INSTALL_PATH=/usr make install-shared \
    && rm -rf /build

pip install -U faust[rocksdb] 


