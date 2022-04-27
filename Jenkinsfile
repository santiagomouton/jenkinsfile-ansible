pipeline {

    agent any
    
//    environment {
//        
//    }

    stages {
        stage('Generate .JAR') {
            agent {
                docker {
                    image 'maven:3.8-openjdk-11-slim'
                    registryUrl 'docker.io'
                    args '--rm -v ${WORKSPACE}/java-app:/app -v "${HOME}/.m2":/root/.m2 -v ${WORKSPACE}/java-app/target:/app/target'
                }
            }
            steps {
                sh 'cd /app'
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Build') {
            steps {
                echo 'Build docker image and remove old'
                sh '''
                    docker rmi -f $(docker images 'appjava' -q) || true
                    docker build -t appjava:${BUILD-TAG} --no-cache
                '''
            }
        }
/*
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
*/
    }
}
