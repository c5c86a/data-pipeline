Demos on writing/testing/monitoring data pipelines

[![Build Status](https://travis-ci.org/nicosmaris/data-piepeline.svg?branch=master)](https://travis-ci.org/nicosmaris/data-pipeline)

Faust with unit tests and instructions for local demo

If entrypoint blocks:

  - docker-compose up -d faust
  - sleep 2
  - docker-compose logs zoo1 kafka1
  - docker-compose logs faust
 
 TODO:

 1. dockerized-demo.sh
