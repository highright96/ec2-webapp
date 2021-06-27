#!/bin/bash
git pull origin master
chmod 755 gradlew
./gradlew test
./gradlew clean build