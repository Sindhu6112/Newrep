pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sindhu6112/my-app'  // Change this to your Docker Hub repo
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
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook -i /etc/ansible/hosts deploy_app.yml'
            }
        }
    }
}
