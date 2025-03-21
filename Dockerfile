FROM ubuntu
RUN apt-get update && apt-get install -y default-jdk maven

COPY ./src
WORKDIR/src

FROM ssriram12/maven-3.9.9:jdk13

RUN mvn clean package
RUN jar --update --verbose --file target/maven-pipeline-demo-1.0-SNAPSHOT.jar --main-class com.github.wololock.App

RUN mv target/maven-pipeline-demo-1.0-SNAPSHOT.jar demo.jar
RUN mvn clean
