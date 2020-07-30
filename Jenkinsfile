pipeline {
    agent any
    stages {
        stage('docker-compose') {
            steps {
                sh "docker-compose build"
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