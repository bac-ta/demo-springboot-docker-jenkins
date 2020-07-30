#For app
FROM java:8
FROM maven:alpine
WORKDIR /app
COPY . /app
RUN mvn -v
RUN mvn clean install -DskipTests
LABEL maintainer=bac93.it@gmail.com
ADD ./target/demo-0.0.1-SNAPSHOT.jar demo-springboot-docker-jenkins.jar
ENTRYPOINT ["java","-jar","demo-springboot-docker-jenkins.jar"]
