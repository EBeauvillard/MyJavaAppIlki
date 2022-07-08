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
            }
        stage('Image') {
            steps {
                echo 'Creating image from Dockerfile'
                sh 'ls'
                sh 'mkdir docker && cd docker && mkdir agent_java && cd agent_java'
                sh 'sudo docker build -t agent_java .'
                sh 'sudo docker images' 
            }
        }
    }
}
