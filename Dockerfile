FROM java:8
COPY ./target/demo-0.0.1-SNAPSHOT.jar /usr/src/app/
WORKDIR /usr/src/app
EXPOSE 5593
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]