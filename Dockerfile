FROM python:3.6-stretch
# slim removes gcc which we need to build python-rocksdb

ENV DEBIAN_FRONTEND noninteractive

RUN pip install -U \
    faust \
    aiocontextvars \
    pytest \
    pytest-asyncio 

RUN mkdir -p /app 
WORKDIR /app

#ENTRYPOINT ["faust", "-A", "hello_world", "worker", "-l", "info"]

ENTRYPOINT ["pytest", "--junitxml=junit.xml"]

