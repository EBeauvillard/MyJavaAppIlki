FROM maven
RUN mvn --version
RUN java -version
RUN ls
COPY ./target/hello.war /usr/local/tomcat/webapps/
RUN mvn tomcat7:run
RUN curl http://localhost:8081/hello
