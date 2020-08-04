#For app
FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
MAINTAINER bac93.it@gmail.com
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=MAVEN_BUILD /build/target/demo-0.0.1-SNAPSHOT.jar  /app/demo-springboot-docker-jenkins.jar
EXPOSE 5593
ENTRYPOINT ["java","-jar","demo-springboot-docker-jenkins.jar"]