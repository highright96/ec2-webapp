FROM adoptopenjdk/openjdk11:alpine-jre

MAINTAINER SANGWOO NAM <highright96@gmail.com>

VOLUME /tmp

EXPOSE 8080

ARG JAR_FILE=build/libs/ec2-webapp-0.0.1-SNAPSHOT.jar

ADD ${JAR_FILE} ec2-webapp.jar

ENTRYPOINT ["java", "-jar", "/ec2-webapp.jar"]

