pipeline {
    agent any
    stages {

        state("Docker build"){
             steps {
                   sh "docker-compose build"
                   sh "docker-compose up -d"
                }
        }

        stage ('Build') {
            steps {
                         git 'https://github.com/bac-ta/demo-springboot-docker-jenkins.git'

                         // Run Maven on a Unix agent.
                         sh "mvn -Dmaven.test.failure.ignore=true clean package"

            }
         }

        stage('Test') {
             steps {

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