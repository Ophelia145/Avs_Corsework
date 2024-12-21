pipeline {
    agent any 
    environment {
        DOCKER_IMAGE = 'ci_cd_test_app'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                   sh "docker build -t ${DOCKER_IMAGE}"
           // docker"
                   // sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    //docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    //docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").run('-d')
                    sh "docker run -v /var/run/docker.sock:/var/run/docker.sock ${DOCKER_IMAGE}"
                }
            }
        }
    }
      post {
        always {
            script {
                echo 'Jenkins is cleaning up...after me ehhh'
                try {
                    def containers = sh(script: "docker ps -q --filter 'name=${DOCKER_IMAGE}'", returnStdout: true).trim()
                    if (containers) {
                        echo "Stopping containers: ${containers}"
                        sh "docker stop ${containers}"
                    }
                } catch (Exception e) {
                    echo "No running containers to stop."
                }
                try {
                    def containers = sh(script: "docker ps -a -q --filter 'name=${DOCKER_IMAGE}'", returnStdout: true).trim()
                    if (containers) {
                        echo "Removing containers: ${containers}"
                        sh "docker rm ${containers}"
                    }
                } catch (Exception e) {
                    echo "No containers to remove."
                }
                echo "Removing Docker images..."
                sh "docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || true" //only if exists
            }
        }
    }
}