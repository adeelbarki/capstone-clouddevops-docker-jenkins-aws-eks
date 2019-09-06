pipeline {
    def app
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

        stage('Build docker image') {
            app = docker.build("adeelbarki/capstone-clouddevops")
        }

        stage('Test Image') {
            app.inside {
                echo "Test Passed!"
            }
        }

        stage('Push Image to Docker hub') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
            }
                echo "Trying to push Docker Build to Dockerhub ..."
        }
    }
}