#For app
FROM java:8
LABEL maintainer=bac93.it@gmail.com
ADD ./target/demo-0.0.1-SNAPSHOT.jar demo-springboot-docker-jenkins.jar
ENTRYPOINT ["java","-jar","demo-springboot-docker-jenkins.jar"]