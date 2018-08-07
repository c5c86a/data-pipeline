#!/bin/bash -ex

docker-compose up -d zoo1 kafka1
sleep 10
docker-compose logs
docker-compose up --build faust
