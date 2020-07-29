pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                 git 'https://github.com/bac-ta/demo-springboot-docker-jenkins.git'
                 sh "./mvnw -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Test') {
            steps {
                //
            }
        }
        stage('Deploy') {
            steps {
                //
            }
        }
    }
}