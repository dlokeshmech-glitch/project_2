pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/dlokeshmech-glitch/project_2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trend-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker stop trend-container || true'
                sh 'docker rm trend-container || true'
                sh 'docker run -d --name trend-container -p 3000:80 trend-app'
            }
        }
    }
}
