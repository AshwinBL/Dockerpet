FROM ubuntu:latest

WORKDIR  petclinic

RUN             apt-get update && \
                apt-get install -y tzdata && \
                apt-get -y install git && \
                apt-get -y install openjdk-8-jdk && \
                apt-get -y install wget && \
                wget http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.36/bin/apache-tomcat-9.0.36.tar.gz && \
                tar -xzvf apache-tomcat-9.0.36.tar.gz && \
                apt-get -y install maven && \
                wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
                tar -xzvf apache-maven-*.tar.gz && \
                git clone https://github.com/spring-projects/spring-petclinic.git && \
                cd spring-petclinic && \
                mvn package -DskipTests
CMD             java -jar target/*.jar

EXPOSE          8686
