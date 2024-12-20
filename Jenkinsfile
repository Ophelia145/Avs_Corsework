pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'ci-cd-test:latest'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    //строим Docker-образ
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
        stage('Deploy Docker Container') {
            steps {
                script {
                    //разворачиваем Docker-контейнер
                    sh 'docker run -d -p 8080:8080 ${DOCKER_IMAGE}'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished'
        }
    }
}