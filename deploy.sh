#!/bin/bash
CONTAINER_NAME=ec2
IMAGE_NAME=ec2:latest

docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker rmi ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
docker run -d --name ${CONTAINER_NAME} -p 9090:9090 -v /home/jenkins:/var/jenkins_home ${IMAGE_NAME}