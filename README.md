Demos on writing/testing/monitoring data pipelines

[![Build Status](https://travis-ci.org/nicosmaris/data-piepeline.svg?branch=master)](https://travis-ci.org/nicosmaris/data-pipeline)

Integration tests with faust, kafka and zookeeper

If entrypoint blocks:

  - docker-compose up -d faust
  - sleep 2
  - docker-compose logs zoo1 kafka1
  - docker-compose logs faust
 
```
sudo: required

services:
  - docker

cache:
  directories:
    - $HOME/docker

env:
  - DOCKER_COMPOSE_VERSION=1.22.0

before_install:
  - sudo rm /usr/local/bin/docker-compose
  - curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
  - chmod +x docker-compose
  - sudo mv docker-compose /usr/local/bin

install:
  - docker-compose up -d zoo1 kafka1
  - sleep 10

script:
  - docker-compose logs
  - docker-compose up faust
  - docker-compose down
```
