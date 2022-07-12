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
                sh 'sudo docker build -t agent_java .'
                sh 'sudo docker images'
                sh 'sudo docker run agent_java'
                sh 'sudo docker ps -a'
            }
        }
    }
}
    
