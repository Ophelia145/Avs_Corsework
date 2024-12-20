pipeline {
    agent any 

    environment {
        DOCKER_IMAGE = 'ci-cd-test:latest' /
    }

    stages {
        stage('Checkout SCM') {
            steps {
                
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                  
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
             
                    sh 'docker run -d --name ci-cd-container ${DOCKER_IMAGE}'
                }
            }
        }

        stage('Stop Docker Container') {
            steps {
                script {
                  
                    sh 'docker stop ci-cd-container'
                }
            }
        }

        stage('Clean up') {
            steps {
                script {
                   
                    sh 'docker rm ci-cd-container'
                    
                    sh 'docker rmi ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            
            sh 'docker system prune -f'
        }
    }
}