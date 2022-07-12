pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                echo 'Compiling..'
                sh 'mvn clean install'
            }
        }
        stage('Tests') {
            steps {
                echo 'Testing..'
                sh 'mvn test'
            }
        }
        stage('Image') {
            steps {
                echo 'Creating image from Dockerfile..'
                sh 'ls'
                sh 'sudo docker build -t ebeauvillard/ilki-training: .'
                sh 'sudo docker images'
                sh 'sudo docker push ebeauvillard/ilki-training'
                sh 'sudo docker ps -a'
            }
        }
    }
}
    
