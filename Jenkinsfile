pipeline {
    agent any

    environment {
        IMAGE_NAME = "lokeshdev7/trend-app_project2:v1"
        AWS_DEFAULT_REGION = "ap-south-1"
    }

    stages {

        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Check Tools') {
            steps {
                sh 'docker --version'
                sh 'aws --version'
                sh 'kubectl version --client'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                    echo "$DOCKER_PASSWORD" | docker login \
                    -u "$DOCKER_USER" \
                    --password-stdin
                    '''
                }
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Configure EKS') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-creds',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    sh '''
                    aws eks update-kubeconfig \
                    --region ap-south-1 \
                    --name trend-cluster
                    '''
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }
}
