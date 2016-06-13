#!/bin/sh -euv
# Script for installing dev dependencies for docker

#
# Install docker
#
echo "Installing docker tools"
sudo apt-get install -y  apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Dependent on Ubuntu Version add corrent repo for docker
#sudo echo "deb https://apt.dockerproject.org/repo ubuntu-precise main"| sudo tee /etc/apt/sources.list.d/docker.list
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
#sudo echo "deb https://apt.dockerproject.org/repo ubuntu-wily main"| sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install -y docker-engine

# Add vagrant to the docker group
sudo usermod -aG docker vagrant

# Install docker compose
sudo sh -c "curl -sL https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo sh -c "chmod +x /usr/local/bin/docker-compose"

echo "Docker tools install complete"
