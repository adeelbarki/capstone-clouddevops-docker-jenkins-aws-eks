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
               }
                }
            }
        }

        stage('List pods') {
            steps {
                withKubeConfig([credentialsId: 'aws-static',
                    caCertificate: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNU1Ea3hOekEwTXpJME5Wb1hEVEk1TURreE5EQTBNekkwTlZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBSnh5CkZqWlBHWGlxQy9vRFVadHYwWDFEN0FwLzNid0hwcTJLK1VXaTlRdmpwZE84YkZ0OTFvdmJnRm0zbnU1N05WTGcKTUYwelJUY2xEZEt6ZklOamd2R2RmSG5kREJlV0hXT1hmK05nUkJTdUJWN04rOUNIUjRicmlNYjVKc0VQaHYwMQoxQ0dEeThyejBialRiM01pcDQ5Y212ZXd0QmE4Z2RWeXJZZ1RGMW0xOUREREE1M0JlYlk0N0doa3FSUkFBdURFCkNEV2ZTZG9mMFhLZS92TVNtSXk4OHpEN2JwV0I4dzRxM0hsUnZGY0U4bWJQTXd2aXhjMEFXbHVvL3B6dnBXOFYKUmJKY09XN0xZMGp0c3YrZnVYMTc3NzBHN3VXdmQzUmwzQzdqQkFIb2xIeTFwblhncVg4V08vN3Q0SWRTN0QySApKZ2RRVGYwOTNROWFPbXlIbzdjQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFFY0VpRFRWb1daSVJ2bUdoekdOWjE1S1F0SHoKeFgxeDJkenVtbWh0c3dqK3p3dHE3SmNGdm5rMnlIR3JQeUdlYk1YOWt3TWNaamx4cTJZckpzeCtrQ3RGQWI5MwptcHV5SEJsUGFLNFpFRXh4SExvbGEvYmpNQis5RVB5TE01aTF6WWxUQUNSSlhiSTVNVS9nU29PQjJvY3BSQWFTCkhpVnJiVHVwaHhxRlpJUWNPUnlYNXJoUENxUEMwenI2L2F2R2FwcWoyN1pibDREUFM2SlpycC9Reml3V0NzaXkKU0Y2eS9DbGNFZS9RTjdQNW0yT28vOUt3VDhTbnliZVFTMVdlMlZRN0VZZzBaYkZLK2hQTldMcC9RZWl3bWd6awowaDcvTzVFNW00RlQ0MUFmckpKT2V5NnczZE1oYUg1eG5uRVRBSXpNbUFMVDZsQ0liNTBGejg4SlVkWT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=',
                    serverUrl: 'https://F63B01BED2F1C1306B7AF1C02D3657C1.gr7.eu-central-1.eks.amazonaws.com',
                    clusterName: 'nginxcluster'
                    ])  
                    script {
                        sh 'kubectl get pods'
                    }
            }
        }    
    }
}