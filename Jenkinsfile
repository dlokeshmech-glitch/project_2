pipeline {
    agent any

    environment {
        IMAGE_NAME = "lokeshdev7/trend-app_project2:v1"
        AWS_DEFAULT_REGION = "ap-south-1"
        CLUSTER_NAME = "trend-cluster"
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
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh '''
                    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to EKS') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {

                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

                    aws eks update-kubeconfig \
                      --region $AWS_DEFAULT_REGION \
                      --name $CLUSTER_NAME

                    kubectl get nodes

                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml

                    kubectl get pods
                    kubectl get svc
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
