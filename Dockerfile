FROM maven
RUN mvn --version
RUN java -version
RUN ls
COPY ./target/hello.war /usr/local/tomcat/webapps/
