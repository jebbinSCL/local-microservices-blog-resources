#!/bin/sh -eu
bash -eu ./buildConfigs.sh
docker-compose up -d
