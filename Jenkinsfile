pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                echo 'Cloning Repository'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t lokeshdev7/trend-app_project2:v1 .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker login -u DOCKER_USER -p DOCKER_PASSWORD'
                sh 'docker push lokeshdev7/trend-app_project2:v1'
            }
        }

        stage('Deploy EKS') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
