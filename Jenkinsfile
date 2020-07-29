pipeline {
    agent any
    stages {
        stage('Build') {
            when { branch 'master' }
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
        state("Docker build"){
            steps {
                sh "docker-compose up"
            }
        }
        stage('Deploy') {
            steps {
                //
            }
        }
    }
}