#!/bin/sh -euv
# Script for installing optional tools/utilities for development

echo "Installing Utilities"
sudo apt-get update

# Get git. nesseccary for oh-my-zsh
sudo apt-get install -y git

# Install curl
sudo apt-get install -y curl

echo "Utilities install complete"
