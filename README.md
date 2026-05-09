# DevOps Practice Project – Trend Application Deployment

## Project Overview

This project demonstrates a complete DevOps workflow for deploying a production-ready application using Docker, Jenkins, Terraform, Kubernetes, and AWS EKS.

The application source contains only production build files (`dist/` folder). The deployment pipeline includes containerization, CI/CD automation, Kubernetes deployment, infrastructure provisioning, monitoring setup, and GitHub integration.

---

# Tools Used

- Git & GitHub
- Docker
- DockerHub
- Jenkins
- Terraform
- AWS EC2
- AWS EKS
- Kubernetes
- kubectl
- eksctl
- Kubernetes Dashboard
- GitHub Webhook

---

# Docker Steps

## Build Docker Image
Run Docker Container
docker run -d -p 80:80 trend-app
Push Docker Image to DockerHub
docker tag trend-app <dockerhub-username>/trend-app:latest
docker push <dockerhub-username>/trend-app:latest
Jenkins Pipeline Explanation

Jenkins was configured as the CI/CD tool for automating the deployment workflow.

Pipeline stages include:

Clone GitHub Repository
Build Docker Image
Push Docker Image to DockerHub
Deploy Application to Kubernetes
Verify Deployment

The pipeline is defined using a Jenkinsfile.

Terraform Explanation
Terraform was used to provision AWS infrastructure resources.

Resources created:

AWS EC2 Instance
Security Groups
Networking Components

Terraform Commands Used:

terraform init
terraform plan
terraform apply

EKS Deployment Steps
Create EKS Cluster
eksctl create cluster \
--name trend-cluster \
--region ap-south-1 \
--nodegroup-name linux-nodes \
--node-type t3.medium \
--nodes 2
Verify Nodes
kubectl get nodes

Deploy Application
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
Kubernetes Commands Used
Check Pods
kubectl get pods

Check Services
kubectl get svc
Check Deployments
kubectl get deployments
Describe Service
kubectl describe svc trend-service
Webhook Integration

GitHub webhook integration was configured with Jenkins for automatic build triggering on every GitHub commit.

Webhook URL format used:

http://<jenkins-public-ip>:8080/github-webhook/
Monitoring Setup

Kubernetes Dashboard and Metrics Server were configured for cluster monitoring and application health checking.

Monitoring Features:
Pod status monitoring
Node monitoring
Deployment monitoring
Resource utilization checking
Application LoadBalancer URL
http://ae864e826725b4d1387e367018756432-1085349571.ap-south-1.elb.amazonaws.com
Application LoadBalancer ARN
Add your LoadBalancer ARN here from AWS Console
Repository Structure
project_2/
│
├── dist/
├── Dockerfile
├── Jenkinsfile
├── deployment.yaml
├── service.yaml
├── main.tf
├── .gitignore
├── .dockerignore
├── screenshots/
└── README.md
creenshots

All deployment, Docker, Jenkins, Terraform, Kubernetes, and monitoring screenshots are available inside the screenshots/ folder.

Project Status

✅ Dockerized Application
✅ Jenkins CI/CD Pipeline
✅ DockerHub Integration
✅ Terraform Infrastructure
✅ AWS EKS Cluster
✅ Kubernetes Deployment
✅ LoadBalancer Service
✅ Monitoring Setup
✅ GitHub Webhook Integration
