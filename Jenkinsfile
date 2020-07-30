pipeline {
    agent any
    stages {
        state('docker-compose') {
             steps {
                   sh "docker-compose build"
                   sh "docker-compose up -d"
                }
        }
        stage('Build') {
            steps {
                         git 'https://github.com/bac-ta/demo-springboot-docker-jenkins.git'

                         // Run Maven on a Unix agent.
                         sh "mvn -Dmaven.test.failure.ignore=true clean package"

            }
         }
        post {
              always {
                 sh "docker-compose down || true"
              }
        }
    }
}