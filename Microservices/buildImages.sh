#!/bin/sh -eu
echo "Building docker images"
docker build --file="./build/Gateway/Dockerfile" -t gateway ./build/Gateway
docker build --file="./build/Greetings/Dockerfile" -t greetings-service ./build/Greetings
docker build --file="./build/GreetingsDb/Dockerfile" -t greetings-db ./build/GreetingsDb
