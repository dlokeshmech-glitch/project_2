DevOps Practice Project – Trend Application Deployment
Project Overview

This project demonstrates a complete DevOps workflow for deploying a production-ready React application using Docker, Jenkins, Terraform, Kubernetes, AWS EKS, and DockerHub.

The objective was to automate the application deployment lifecycle from infrastructure provisioning to Kubernetes deployment using CI/CD principles.

Architecture
GitHub Repository
        │
        ▼
     Jenkins
        │
        ▼
 Docker Build
        │
        ▼
 DockerHub
        │
        ▼
 Amazon EKS
        │
        ▼
 Kubernetes Deployment
        │
        ▼
 Application LoadBalancer
Tools & Technologies Used
Tool	Purpose
GitHub	Source Code Management
Jenkins	CI/CD Pipeline
Docker	Containerization
DockerHub	Container Registry
Terraform	Infrastructure Provisioning
AWS EC2	Jenkins Server
AWS EKS	Kubernetes Cluster
Kubernetes	Container Orchestration
Metrics Server	Cluster Monitoring
AWS LoadBalancer	Application Exposure
Application Deployment

Repository Used:

https://github.com/Vennilavanugvi/Trend.git

Application Port:

3000
Docker Implementation
Dockerfile Creation

A Dockerfile was created to containerize the React application.

Docker Image Build
docker build -t lokeshdev7/trend-app_project2:v1 .
Docker Image Push
docker push lokeshdev7/trend-app_project2:v1

DockerHub Repository:

https://hub.docker.com/r/lokeshdev7/trend-app_project2
Terraform Infrastructure

Terraform was used to provision AWS infrastructure.

Resources Created:

VPC
Public Subnets
Internet Gateway
Route Tables
Security Groups
EC2 Instance (Jenkins Server)
EKS Cluster
EKS Worker Nodes

Terraform Commands:

terraform init
terraform plan
terraform apply
Kubernetes Setup

Amazon EKS Cluster was created and configured.

Cluster Verification:

kubectl get nodes

Deployment Creation:

kubectl apply -f deployment.yaml

Service Creation:

kubectl apply -f service.yaml

Verification:

kubectl get pods
kubectl get svc
Version Control

GitHub was used as the source code repository.

Git Commands Used:

git init
git add .
git commit -m "Initial Commit"
git push origin main

Additional Files:

.gitignore
.dockerignore
Jenkins CI/CD Pipeline

Jenkins was installed on AWS EC2.

Plugins Installed
Docker Pipeline
Git
Pipeline
Kubernetes CLI
Credentials Binding
Jenkins Credentials
DockerHub Credentials
ID: dockerhub-creds
AWS Credentials
ID: aws-creds
Pipeline Stages
Source Code Checkout
Docker Build
Docker Login
Docker Push
Configure EKS
Deploy to Kubernetes
Verification

Pipeline automatically:

Pulls code from GitHub
Builds Docker image
Pushes image to DockerHub
Deploys application to EKS
GitHub Webhook Integration

GitHub Webhook was configured to trigger Jenkins builds automatically whenever code is pushed to the repository.

Webhook Endpoint:

http://<jenkins-public-ip>:8080/github-webhook/

Benefits:

Automated CI/CD
Automatic deployments
Reduced manual intervention
Monitoring
Monitoring Setup

Open-source Kubernetes monitoring was configured to monitor cluster and application health.

Metrics Server

Metrics Server was deployed for Kubernetes cluster monitoring.

Purpose:

Monitor cluster status
Monitor node availability
Monitor pod health
Resource usage monitoring
Cluster Health Monitoring

Commands Used:

kubectl get nodes
kubectl get pods -A
kubectl get deployments -A
kubectl get svc -A
Monitoring Outcome

Verified:

Worker Node Health
Kubernetes Pod Health
Deployment Status
Service Availability
Cluster Readiness
Screenshots

Screenshots are available in:

screenshots/

Included Screenshots:

Terraform Apply
AWS Infrastructure
Jenkins Installation
Jenkins Dashboard
Jenkins Credentials
Jenkins Pipeline
Docker Build
DockerHub Repository
EKS Cluster
Kubernetes Pods
Kubernetes Services
GitHub Webhook
Application Access through LoadBalancer
Monitoring Screenshots
Application Verification

Verify Application:

kubectl get svc

Obtain LoadBalancer URL and access:

http://<LoadBalancer-DNS>

Application successfully deployed and accessible through Kubernetes LoadBalancer.

Project Outcome

Successfully implemented:

✅ Docker Containerization

✅ Terraform Infrastructure Provisioning

✅ AWS EKS Kubernetes Cluster

✅ Jenkins CI/CD Pipeline

✅ DockerHub Integration

✅ GitHub Webhook Automation

✅ Kubernetes Deployment

✅ Application Exposure via LoadBalancer

✅ Cluster Monitoring

✅ End-to-End DevOps Automation

Author

Lokesh D

DevOps Practice Project – Trend Application Deployment
