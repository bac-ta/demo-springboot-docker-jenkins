pipeline {
    agent any
    environment {
        COMPOSE_FILE = "docker-compose.yml"
        PATH = "$PATH:/usr/local/bin"
    }
    tools {
        maven 'MAVEN_HOME'
        docker 'DOCKER_HOME'
    }
    stages {
        stage('Docker Compose') {
            steps {
                sh "docker-compose -f ${env.COMPOSE_FILE} build"
                sh "docker-compose up -d"
            }
        }
        stage('Build') {
            steps {
                git 'https://github.com/bac-ta/demo-springboot-docker-jenkins.git'
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    }
}