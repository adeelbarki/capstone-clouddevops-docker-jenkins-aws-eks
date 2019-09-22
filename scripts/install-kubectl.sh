# Install kubectl

sudo apt update
sudo apt upgrade
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl\
    -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Test if kubectl is working
# kubectl version --short --client

# -------------------------------------------------------------------------------------

# Install AWS-iam-authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator.sha256
openssl sha1 -sha256 aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
 
# Test if aws-iam-authenticator is working
# aws-iam-authenticator help

# -------------------------------------------------------------------------------------------

# Install aws-cli

# First check python / python3 and pip3 version 
# python --version
# python3 --version 
# pip3 --version 
# If not installed the install it. 
sudo apt install python3-pip
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
export PATH=~/.local/bin:$PATH
source ~/.bashrc
# pip3 --version (check version)


# Now install aws-cli
pip3 install awscli --upgrade --user
# aws --version (check version)

# ------------------------------------------

# aws configure (Update aws credentials - IAM user programmetic acces - Amazonadmin access) 
# Update kube-config file
aws eks update-kubeconfig --name nginxcluster



# ------------------------------------------

# Install Docker (if not installed)
# Look into install-dockers.sh file in order to install dockers


# # Install Minikube
# curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64\
#  && chmod +x minikube && sudo mv minikube /usr/local/bin/

#  # Run minikube
#  minikube start --vm-driver=none

#  # Pull image from docker hub
#  kubectl run capstone-clouddevops --image=adeelbarki/capstone-clouddevops:latest --port=80
#  kubectl expose deployment capstone-clouddevops --type=LoadBalancer --port=80
#  sudo kubectl get services
#  minikube service capstone-clouddevops


