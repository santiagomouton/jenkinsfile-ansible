pipeline {

    agent any
    
    environment {
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh

                '''
            }

            post {
                success {
               
                }
            }
        }

        stage('Test') {
            steps {
            }

            post {
                always {
                }
            }
        }

        stage('Push') {
            steps {
            }
        }

        stage('Deploy') {
            steps {
            }
        }
    }
}
