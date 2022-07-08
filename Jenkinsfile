pipeline {
    agent any
    stages {
        stage('Dependencies') {
            steps {
                echo 'Installing dependencies..'
                sh 'apt-get update'
                sh "echo '* libraries/restart-without-asking boolean true' | debconf-set-selections"
                sh 'apt-get install -y openjdk-8-jdk git curl wget'
                sh 'wget http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz'
                sh 'mv apache-maven-3.5.4-bin.tar.gz /opt'
                sh 'tar -xvf /opt/apache-maven-3.5.4-bin.tar.gz -C /opt'
                sh 'mv /opt/apache-maven-3.5.4 /opt/apache-maven'
                sh 'update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001'
                sh 'update-ca-certificates --fresh'
                sh 'mvn --version'
                sh 'java -version'
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
    
