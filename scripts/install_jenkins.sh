#!/usr/bin/env bash

# change permission on file
# sudo chown ubuntu:group <filename>
# chmod 700 <filename>
# run sudo ./<filename> 

# Install updates
apt -y update
apt -y upgrade
apt -y install default-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt -y update
apt -y install jenkins

# Check Jenkins status
#systemctl status jenkins

# Find Autogenerated Password
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Finally visit the dns with port 8080 on your browser

# Install Tidy
apt-get -y install -y tidy
