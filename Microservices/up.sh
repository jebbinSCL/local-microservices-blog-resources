#!/bin/sh -eu
bash -eu ./buildConfigs.sh
docker-compose -p app up -d
