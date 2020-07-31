pipeline {
    agent any
    environment {
        COMPOSE_FILE = "docker-compose.yml"
        PATH = "$PATH:/usr/local/bin"
    }
    tools {
        maven 'MAVEN_HOME'
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
                sh "mvn clean package install"
            }
        }
    }
    post {
            always {
                // Always cleanup after the build.
                sh 'docker-compose -f ${env.COMPOSE_FILE} down'
            }
    }
}