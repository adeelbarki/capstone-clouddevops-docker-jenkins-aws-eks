# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl\
    -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Install Docker (if not installed)
# Look into install-dockers.sh file in order to install dockers


# Install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64\
 && chmod +x minikube && sudo mv minikube /usr/local/bin/

 # Run minikube
 minikube start --vm-driver=none

 # Pull image from docker hub
 kubectl run capstone-clouddevops --image=adeelbarki/capstone-clouddevops:latest --port=80
 kubectl expose deployment capstone-clouddevops --type=LoadBalancer --port=80
 sudo kubectl get services
 minikube service capstone-clouddevops


