#!/bin/sh -eu

sh ./setupBuildTools.sh
sh ./buildServices.sh
sh ./buildImages.sh
sh ./up.sh
