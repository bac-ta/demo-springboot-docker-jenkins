
FROM java:8
FROM maven:alpine

# image layer
WORKDIR /app
ADD pom.xml /app
RUN mvn verify clean --fail-never

# Image layer: with the application
COPY . /app
RUN mvn -v
RUN mvn clean install -DskipTests
ADD ./target/demo-0.0.1-SNAPSHOT.jar /developments/my-app.jar
EXPOSE 5593
ENTRYPOINT ["java","-jar","/developments/my-app.jar"]