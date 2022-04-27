pipeline {

    agent any
    
//    environment {
//        
//    }

    stages {
        stage('Build') {
            steps {
                echo 'Generate .jar'
                docker.image('maven:3-alpine').wihtRun(
                    '--rm -v ${WORKSPACE}/java-app:/app -v "${HOME}/.m2":/root/.m2 -v ${WORKSPACE}/java-app/target:/app/target -w /app'
                    ){ c -> 
                    sh 'mvn -B -DskipTests clean package' 
                }
                echo 'Build docker image and remove old'
                sh '''
                    docker rmi -f $(docker images 'appjava' -q) || true
                    docker build -t appjava:${BUILD-TAG}
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
