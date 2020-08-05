pipeline {
    agent any
    environment {
        COMPOSE_FILE = "docker-compose.yml"
        PATH = "$PATH:/usr/local/bin"
    }
    tools {
        maven "MAVEN_HOME"
    }
    stages {
        stage("Docker Compose") {
            steps {
                sh "docker-compose build"
                sh "docker-compose up -d"
            }
        }
        stage("Build And Deploy") {
            steps {
                git "https://github.com/bac-ta/demo-springboot-docker-jenkins.git"
                sh "mvn clean install spring-boot:run"
            }
        }
    }
    post {
            always {
                // Always cleanup after the build.
                sh "docker-compose -f ${env.COMPOSE_FILE} down"
            }
    }
}