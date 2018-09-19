#!/bin/sh

docker build -t test-a -f Dockerfile-a .
docker build -t test-b -f Dockerfile-b .
docker build -t test-b2 -f Dockerfile-b2 .

docker images | grep -e "^test-"


echo "------------------------- test-a"
docker run --rm test-a ls -l /libs
echo "------------------------- test-b"
docker run --rm test-b ls -l /libs
echo "------------------------- test-b2"
docker run --rm test-b2 ls -l /libs