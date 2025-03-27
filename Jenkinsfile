pipeline {
    agent any
    stages {
        stage('Clone') {
            steps { git url: 'https://github.com/Sindhu6112/Newrep.git', branch: 'main' }
        }
        
        stage('Build') {
            steps { sh 'docker build -t sindhu6112/my-app .' }
        }
        
        stage('Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub-credentials',  // Using existing creds
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_PASS'
                )]) {
                    sh '''
                        echo "$DOCKERHUB_PASS" | docker login -u "$DOCKERHUB_USER" --password-stdin
                        docker push sindhu6112/my-app:latest
                    '''
                }
            }
        }
        
        stage('Deploy') {
            steps {
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'application-server-key',
                    keyFileVariable: 'SSH_KEY',
                    usernameVariable: 'SSH_USER'
                )]) {
                    sh '''
                        ansible-playbook -i inventory.ini \
                        --private-key "$SSH_KEY" \
                        -u "$SSH_USER" \
                        deploy.yml
                    '''
                }
            }
        }
    }
}
