#!/usr/bin/env bash

# change permission on file
# sudo chown ubuntu:group <filename>
# chmod 700 <filename>
# run sudo ./<filename> 

# Install updates
apt update
apt upgrade

# Install packages to allow apt to use a repository over HTTPS:
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index.
apt update

# Install the latest version of Docker CE
apt-get install docker-ce

# Give permission to user
# sudo usermod -a -G docker $USER
sudo usermod -a -G docker jenkins

