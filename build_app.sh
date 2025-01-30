#!/bin/bash

docker rmi my_app
docker build -t my_app -f Dockerfile .

