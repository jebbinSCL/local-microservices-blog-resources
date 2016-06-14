#!/bin/sh -eu

sh -eu ./setupBuildTools.sh
sh -eu ./buildServices.sh
sh -eu ./buildImages.sh
sh -eu ./up.sh
