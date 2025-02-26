#!/bin/bash

docker rmi my_db
docker build -t my_db -f Dockerfile_mysql .
 
