#!/usr/bin/env bash


# -------------------------------------Install kubectl-----------------------------------------------
sudo apt update
sudo apt upgrade
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl\
    -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Test if kubectl is working
# kubectl version --short --client


# --------------------------------Install AWS-iam-authenticator--------------------------------------
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
# mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
# echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
 
# Test if aws-iam-authenticator is working
# aws-iam-authenticator help


# -------------------------------------Install aws-cli----------------------------------------------

# First check python / python3 and pip3 version 
# python --version
# python3 --version 
# pip3 --version 
# If not installed, to install it. 

sudo apt -y install python3-pip
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
# export PATH=~/.local/bin:$PATH (in jenkins user too)
# source ~/.bashrc
# Now install aws-cli

pip3 install awscli --upgrade --user
# check pip3 version
# pip3 --version
# Move to local bin to get accessed through jenkins user
sudo cp -r ./bin/* /usr/local/bin/

# Check aws version from jenkins user
# sudo su jenkins 
# aws --version

# Update aws credentials - IAM user programmetic acces - Amazon-admin access) 
# aws configure


# ---------------------------------Update kube-config file------------------------------
aws eks update-kubeconfig --name nginxcluster


# ----------------------------------------Optional---------------------------------------------------
#  # Pull image from docker hub
#  kubectl run capstone-clouddevops --image=adeelbarki/capstone-clouddevops:latest --port=80
#  kubectl expose deployment capstone-clouddevops --type=LoadBalancer --port=80
#  sudo kubectl get services


