pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = 'vrushabh015'
        DOCKER_HUB_PASS = 'Vrushabh@89046'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Vrushabh-gomai/AccuKnox.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('vrushabh015/wisecow-app', '/var/lib/jenkins/workspace/Wisecow-Deployment')
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    sh 'echo $DOCKER_HUB_PASS | docker login -u $DOCKER_HUB_USER --password-stdin'
                    sh 'docker push vrushabh015/wisecow-app:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply Kubernetes manifests
                    sh 'kubectl apply -f wisecow-deployment.yaml'
                    sh 'kubectl apply -f wisecow-service.yaml'
                    sh 'kubectl apply -f wisecow-ingress.yaml'
                }
            }
        }
    }
}
