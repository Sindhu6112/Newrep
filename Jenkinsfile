pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sindhu6112/my-app'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Sindhu6112/Newrep.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u sindhu6112 --password-stdin'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Application Server') {
            steps {
                sshagent(['application-server-key']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no ec2-user@13.49.230.208 <<EOF
                    docker stop my-app || true
                    docker rm my-app || true
                    docker pull sindhu6112/my-app
                    docker run -d -p 80:80 --name my-app sindhu6112/my-app
                    EOF
                    '''
                }
            }
        }
    }
}
