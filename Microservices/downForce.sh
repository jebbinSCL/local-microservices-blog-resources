#!/bin/sh -eu
cd compose
docker-compose kill && docker-compose rm -f
