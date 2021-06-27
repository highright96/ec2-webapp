#!/bin/bash
CONTAINER_NAME=highright96-ec2
IMAGE_NAME=highright96/ec2:latest

git pull origin master
chmod 755 gradlew
./gradlew clean build

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker rmi ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
docker run -d --name ${CONTAINER_NAME} -p 9090:9090 -v /home/jenkins:/var/jenkins_home highright96/ec2:latest