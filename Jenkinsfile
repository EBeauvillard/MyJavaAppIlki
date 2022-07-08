pipeline {
    agent any
    stages {
        stage('Dependencies') {
            steps {
                echo 'Installing dependencies..'
                sh 'sudo apt-get update'
                sh "echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections"
                sh 'sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common'
                sh 'wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -'
                sh 'sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/'
                sh 'sudo apt-get update'
                sh 'sudo apt install adoptopenjdk-8-hotspot'
                sh 'wget http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz'
                sh 'sudo mv apache-maven-3.5.4-bin.tar.gz /opt'
                sh 'sudo tar -xvf /opt/apache-maven-3.5.4-bin.tar.gz -C /opt'
                sh 'sudo mv /opt/apache-maven-3.5.4 /opt/apache-maven'
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
    
