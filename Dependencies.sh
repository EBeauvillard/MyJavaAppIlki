#!/bin/bash

sudo apt-get update
echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections
sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt-get update
sudo apt install adoptopenjdk-8-hotspot
wget http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
sudo mv -n apache-maven-3.5.4-bin.tar.gz /opt
sudo tar -xvf /opt/apache-maven-3.5.4-bin.tar.gz -C /opt
sudo mv -n /opt/apache-maven-3.5.4 /opt/apache-maven
sudo update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001
sudo update-ca-certificates --fresh
mvn --version
java -version
