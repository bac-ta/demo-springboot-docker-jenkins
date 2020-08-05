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
        stage('Build') {
            steps {
                git 'https://github.com/bac-ta/demo-springboot-docker-jenkins.git'
                sh "mvn clean install -DskipTests"
            }
        }
        stage('Docker Compose') {
            steps {
                sh "docker-compose up --build"
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