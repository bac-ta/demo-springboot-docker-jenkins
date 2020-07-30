pipeline {
    agent any
    stages {
        stage('docker-compose') {
            agent { docker 'maven:3-alpine' }
            steps {
                sh "docker-compose build"
                sh "docker-compose up -d"
            }
        }
        stage('Build') {
            agent { docker 'openjdk:8-jre' }
            steps {
                git 'https://github.com/bac-ta/demo-springboot-docker-jenkins.git'
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
    }
}