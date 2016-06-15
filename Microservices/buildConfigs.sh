#!/bin/bash -eu
echo "Preparing service configurations"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR="$DIR/build"
CONFIG_DIR="$DIR/config"

echo "Enter ip for the docker host (The virtualBox VM this is probably an address with the format 10.0.*.*):"
read DOCKER_HOST_IP

mkdir -p $BUILD_DIR
sed "s/{DOCKER_HOST_IP}/$DOCKER_HOST_IP/" $CONFIG_DIR/gateway.networking.config > $BUILD_DIR/gateway.networking.config
sed "s/{DOCKER_HOST_IP}/$DOCKER_HOST_IP/" $CONFIG_DIR/greetings.networking.config > $BUILD_DIR/greetings.networking.config
