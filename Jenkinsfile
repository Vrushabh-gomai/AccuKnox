pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "<your-docker-registry>/wisecow:latest"
        KUBE_CONFIG = credentials('kubeconfig')
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
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image(DOCKER_IMAGE).push('latest')
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh 'kubectl apply -f wisecow-deployment.yaml'
                        sh 'kubectl apply -f wisecow-service.yaml'
                        sh 'kubectl apply -f wisecow-ingress.yaml'
                    }
                }
            }
        }
    }
}
