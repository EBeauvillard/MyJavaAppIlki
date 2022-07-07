pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                echo 'Compiling..'
                sh 'mvn clean install'
            }
        }
        stage('Run') {
            steps {
                echo 'Running..'
                sh 'mvn tomcat7:run'
            }
        }
    }
}
