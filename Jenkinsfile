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
        stage("Maven Build Jar File") {
            steps {
                git "https://github.com/bac-ta/demo-springboot-docker-jenkins.git"
                sh "mvn clean install -DskipTests"
            }
        }
        stage("Docker Compose Build Enviroment") {
            steps {
                sh "docker-compose down -v"
                sh "docker-compose build"
                script {
                    sh "docker-compose up"
                }
            }
        }
    }
}