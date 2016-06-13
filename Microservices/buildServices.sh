#!/bin/sh -eu
echo "Building Services"
mono packages/FAKE/tools/FAKE.exe build.fsx
