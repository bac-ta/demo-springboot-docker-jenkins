pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                //
            }
        }
        state("Docker build"){
             steps {
                   sh "docker-compose build"
                   sh "docker-compose up -d"
                }
        }
        stage('Deploy') {
            steps {
                //
            }
        }
        post {
              always {
                 sh "docker-compose down || true"
              }
         }
    }
}