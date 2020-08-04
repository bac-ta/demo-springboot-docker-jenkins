#For app
FROM java:8
FROM maven:alpine
WORKDIR /app
COPY . /app
RUN mvn -v
RUN mvn pakage
LABEL maintainer=bac93.it@gmail.com
COPY ./target/demo-0.0.1-SNAPSHOT.jar demo-springboot-docker-jenkins.jar
EXPOSE 5593
ENTRYPOINT ["java","-jar","demo-springboot-docker-jenkins.jar"]