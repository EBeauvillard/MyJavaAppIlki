pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-ebeauvillard')
	}
    stages {
        stage('Compile') {
            steps {
                echo 'Compiling..'
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'mvn test'
            }
        }
        stage('Creating image') {
            steps {
                echo 'Creating image from Dockerfile..'
                sh 'ls'
                sh 'sudo docker build -t ebeauvillard/ilki-training .'
                sh 'sudo docker images'
                sh 'sudo docker ps -a'
            }
        }
  		stage('Loging in DockerHub') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('Pushing image to Docker hub') {
			steps {
                sh 'sudo docker push ebeauvillard/ilki-training:latest'
			}
		}
    }
}
    
