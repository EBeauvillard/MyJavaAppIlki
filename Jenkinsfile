pipeline {
    agent {
        docker {
            image 'ubuntu'
            args '-u root:sudo -v $HOME/workspace/myproject:/myproject'
        }
    }
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
                sh 'docker build -t agent_java .'
                sh 'docker images' 
            }
        }
    }
}
    
