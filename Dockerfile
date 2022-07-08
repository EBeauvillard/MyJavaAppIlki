FROM evarga/jenkins-slave
RUN apt-get update
RUN echo '* libraries/restart-without-asking boolean true' | debconf-set-selections
RUN apt-get install -y openjdk-8-jdk git curl wget
RUN wget http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
RUN mv apache-maven-3.5.4-bin.tar.gz /opt
RUN tar -xvf /opt/apache-maven-3.5.4-bin.tar.gz -C /opt
RUN mv /opt/apache-maven-3.5.4 /opt/apache-maven
RUN update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001
RUN update-ca-certificates --fresh
RUN mvn --version
RUN java -version
RUN mvn clean install
COPY ./target/hello.war /usr/local/tomcat/webapps/
