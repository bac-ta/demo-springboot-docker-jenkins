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
                sh "docker-compose build"
                sh "docker-compose up -d"
            }
        }
        state("Deploy app") {
            steps {
                script {
                    sh "docker-compose up"
                }
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