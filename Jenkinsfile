pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                echo 'Compiling..'
            }
        }
        stage('Tests') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Image') {
            steps {
                echo 'Creating image from Dockerfile'
                sh 'ls'
                sh 'sudo docker build -t agent_java .'
                sh 'sudo docker images' 
            }
        }
    }
}
    
