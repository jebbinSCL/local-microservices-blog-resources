#!/bin/sh -eu
echo "Building Services"
sh -eu ./setupBuildTools.sh
mono packages/FAKE/tools/FAKE.exe build.fsx
