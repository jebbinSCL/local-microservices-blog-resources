#!/bin/bash -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR="$DIR/build"

#Service id is used for naming proxy container,and selecting the correct port.
echo "Enter service id (See servicePortMapping.sh for options):"
read SERVICE_ID
SERVICE_PORT=$($DIR/servicePortMapping.sh $SERVICE_ID)

echo "Enter VM host ip (Windows) on host only network (use ipconfig on windows). This is most likely 192.168.56.1:"
read HOST_IP

sed "s/{PROXY_IP}/$HOST_IP/;s/{PORT}/$SERVICE_PORT/" $DIR/config/proxy.default.conf > $BUILD_DIR/$SERVICE_ID.default.conf

docker run -d --name ${SERVICE_ID}_proxy -v $BUILD_DIR/$SERVICE_ID.default.conf:/etc/nginx/conf.d/default.conf -p $SERVICE_PORT:$SERVICE_PORT nginx
