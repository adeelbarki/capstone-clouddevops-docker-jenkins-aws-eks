pipeline {
    environment {
    registry = "adeelbarki/capstone-clouddevops"
    registryCredential = 'docker-hub'
    }
    
    agent any
    stages {
        
        stage ('Lint HTML') {
            steps {
                sh 'tidy -q -e *.html'
            }
        }
        
        stage ('Upload to AWS') {
            steps {
               withAWS(region: 'eu-central-1', credentials: 'aws-static') {
               s3Upload(file: 'index.html', bucket: 'udacity-jenkins-adeelbarki')
                }
            }
        }

        stage ('Cloning Git') {
            steps {
                git 'https://github.com/adeelbarki/capstone-clouddevops-docker-jenkins-aws-eks.git'
            }
        }

        stage('Building image') {
            steps {
                script {
                    sh 'docker build --tag=adeelbarki/capstone-clouddevops .'
                }
            }
        }

        stage('Deploy Image') {
            steps {
                script {
                    withDockerRegistry([ credentialsId: "docker-hub", url: "" ]) {
                    sh 'docker push adeelbarki/capstone-clouddevops'
                    }
                }
            }
        }

        stage ('Upload deployment to AWS') {
            steps {
               withAWS(region: 'eu-central-1', credentials: 'aws-static') {
               s3Upload(file: 'Deployment', bucket: 'udacity-jenkins-adeelbarki')
               script {
                   sh 'kubectl version --short --client'
                   sh 'pip3 install awscli --upgrade --user'
                   sh 'mkdir -p /var/lib/jenkins/bin && cp ./aws-iam-authenticator /var/lib/jenkins/bin/aws-iam-authenticator && export PATH=/var/lib/jenkins/bin:$PATH'
                   sh 'echo "export PATH=/var/lib/jenkins/bin:$PATH" >> ~/.bashrc'
                   sh 'echo "export PATH=/var/lib/jenkins/.local/bin:$PATH" >> ~/.bashrc'
                   sh 'aws-iam-authenticator help'
                   sh 'aws --version'
                //    sh 'pwd'
                //    sh 'cp chown jenkins /var/lib/jenkins/.kube'
                //    sh 'chown jenkins /var/lib/jenkins/.kube'
                //    sh 'chown jenkins /var/lib/jenkins/.aws'
                //    sh 'chown jenkins /var/lib/jenkins/.aws/config'
                //    sh 'chown jenkins /var/lib/jenkins/.aws/credentials'
                //    sh 'kubectl apply -f /var/lib/jenkins/.kube/aws-auth-cm.yml'
               }
                }
            }
        }
    }
}