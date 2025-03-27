pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main' , url:'https://github.com/Sindhu6112/Newrep.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub', url: '']) {
                    sh 'docker push my-app'
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
