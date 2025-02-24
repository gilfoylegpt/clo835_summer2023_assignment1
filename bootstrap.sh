#!/bin/bash

docker network create -d bridge --subnet 10.0.0.0/24 --gateway 10.0.0.1 mynet 
DB_REPO_URI=138098912972.dkr.ecr.us-east-1.amazonaws.com/clo835-assignment1-db
aws ecr get-login-password --region us-east-1 | docker login -u AWS $DB_REPO_URI --password-stdin
docker run -d -e MYSQL_ROOT_PASSWORD=pw --network mynet --name mysql-db $DB_REPO_URI

export DBHOST=10.0.0.2
export DBPORT=3306
export DBUSER=root
export DATABASE=employees
export DBPWD=pw
APP_REPO_URI=138098912972.dkr.ecr.us-east-1.amazonaws.com/clo835-assignment1-app
aws ecr get-login-password --region us-east-1 | docker login -u AWS $APP_REPO_URI --password-stdin
declare -A color_ports
color_ports=(
    ["blue"]=8081
    ["pink"]=8082
    ["lime"]=8083
)
for color in "${!color_ports[@]}"
do
    port=${color_ports[$color]}
    docker run -d -p ${port}:8080 -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e DBUSER=$DBUSER -e DATABASE=$DATABASE -e DBPWD=$DBPWD -e APP_COLOR=${color} \
    --network mynet --name ${color}-app $APP_REPO_URI
done