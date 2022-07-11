pipeline {
    agent any
    stages {
        stage('Dependencies') {
            steps {
                echo 'Installing dependencies..'
                sh 'sh Dependencies.sh'
            }
        }
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
            }
        }
    }
}
    
