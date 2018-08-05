FROM python:3.6-stretch
# slim removes gcc which we need to build python-rocksdb

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends wget make build-essential checkinstall libgflags-dev libsnappy-dev zlib1g-dev libbz2-dev liblz4-dev git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

RUN mkdir /build \
    && cd /build \
    && git clone https://github.com/facebook/rocksdb.git \
    && cd rocksdb \
    && git checkout v5.14.2 \
    && INSTALL_PATH=/usr make install-shared \
    && rm -rf /build

RUN pip install -U faust[rocksdb]
RUN pip install aiocontextvars
COPY hello_world.py ./

ENTRYPOINT ["faust", "-A", "hello_world", "worker", "-l", "info"]

