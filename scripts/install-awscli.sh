#!/usr/bin/env bash

# -------------------------------------Pre-requiste -----------------------------------------------
# Change back to ubuntu user

# -------------------------------------Install aws-cli----------------------------------------------

# First check python / python3 and pip3 version 
# python --version
# python3 --version 
# pip3 --version 
# If not installed, to install it. 

sudo apt -y install python3-pip
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
# export PATH=~/.local/bin:$PATH (in jenkins user too)
# source ~/.bashrc
# Now install aws-cli

pip3 install awscli --upgrade --user
# check pip3 version
# pip3 --version
# Move to local bin to get accessed through jenkins user
cp -r ~/.local/bin/* /usr/local/bin/

# Check aws version from jenkins user
# sudo su jenkins 
# aws --version

# Update aws credentials - IAM user programmetic acces - Amazon-admin access) 
# aws configure


# ---------------------------------Update kube-config file------------------------------
aws eks update-kubeconfig --name nginxcluster


# ----------------------------------------Commands to Remember (Optional)---------------------------------------------------
#  # Pull image from docker hub
#  kubectl run capstone-clouddevops --image=adeelbarki/capstone-clouddevops:latest --port=80
#  kubectl expose deployment capstone-clouddevops --type=LoadBalancer --port=80
#  sudo kubectl get services
