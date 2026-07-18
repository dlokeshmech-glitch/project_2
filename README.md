# 🚀 Trend Store Application Deployment using DevOps on AWS

## 📌 Project Overview

This project demonstrates a complete end-to-end DevOps implementation for deploying the **Trend Store React Application** on **Amazon Web Services (AWS)** using modern DevOps tools and best practices.

The application is containerized with Docker, infrastructure is provisioned using Terraform, Continuous Integration and Continuous Deployment (CI/CD) is implemented through Jenkins, the application is deployed to Amazon EKS, and monitoring is configured using Prometheus and Grafana.

---

# 🏗️ Project Architecture

```
                    GitHub Repository
                           │
                           ▼
                      Jenkins Pipeline
                  (Build • Test • Deploy)
                           │
            ┌──────────────┴──────────────┐
            ▼                             ▼
     Docker Image Build             Terraform
            │                  Infrastructure as Code
            ▼                             │
      DockerHub Registry                  ▼
            │                    AWS Infrastructure
            │                  (VPC, EC2, IAM, SG)
            ▼                             │
      Amazon EKS Cluster ◄────────────────┘
            │
            ▼
     Trend Store Application
            │
            ▼
  Prometheus + Node Exporter
            │
            ▼
      Grafana Dashboard
```

---

# 📂 Repository Structure

```
project_2/
│
├── dist/
├── jenkins-terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── main.tf
│   ├── outputs.tf
│   ├── jenkins-install.sh
│   └── README.md
│
├── monitoring/
│   ├── docker-compose.yml
│   ├── prometheus.yml
│   ├── README.md
│   └── Screenshots
│
├── screenshots/
│
├── Dockerfile
├── Jenkinsfile
├── deployment.yaml
├── service.yaml
├── .gitignore
├── .dockerignore
└── README.md
```

---

# 🛠️ Technologies Used

| Category | Tools |
|-----------|-------|
| Cloud | AWS |
| Infrastructure | Terraform |
| CI/CD | Jenkins |
| Containerization | Docker |
| Container Registry | DockerHub |
| Orchestration | Kubernetes (Amazon EKS) |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Version Control | Git |
| Repository | GitHub |
| OS | Ubuntu 24.04 LTS |

---

# 🚀 Project Workflow

## Step 1 – Version Control

- Created GitHub Repository
- Added source code
- Configured `.gitignore`
- Configured `.dockerignore`
- Managed project using Git

---

## Step 2 – Docker

- Created Dockerfile
- Built Docker Image

```
docker build -t trend-app .
```

Verified container execution

```
docker run -p 3000:3000 trend-app
```

---

## Step 3 – DockerHub

Created DockerHub Repository

Tagged Image

```
docker tag trend-app username/trend-app:latest
```

Pushed Image

```
docker push username/trend-app:latest
```

---

## Step 4 – Infrastructure Provisioning using Terraform

Terraform was used to provision AWS infrastructure.

Infrastructure includes

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Groups
- IAM Role
- EC2 Instance
- Jenkins Installation

Terraform Commands

```
terraform init
terraform validate
terraform plan
terraform apply
```

---

## Step 5 – Jenkins Installation

Jenkins was automatically installed on the EC2 instance using a Terraform user-data shell script.

Installed Plugins

- Docker
- Kubernetes
- Pipeline
- Git
- GitHub Integration

Configured

- GitHub Webhook
- DockerHub Credentials
- AWS Credentials
- Kubernetes Credentials

---

## Step 6 – Jenkins CI/CD Pipeline

Pipeline Stages

```
Git Checkout

↓

Docker Build

↓

Docker Image Push

↓

Deploy to Amazon EKS

↓

Verify Deployment
```

Jenkinsfile automates the complete CI/CD workflow.

---

## Step 7 – Amazon EKS Deployment

Created Kubernetes Cluster

Configured

- Deployment.yaml
- Service.yaml

Deployment Commands

```
kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl get pods

kubectl get svc
```

Verified

- Running Pods
- External LoadBalancer
- Application Accessibility

---

# 📊 Monitoring Setup

Open-source monitoring tools were configured for cluster health monitoring.

Components

- Prometheus
- Grafana
- Node Exporter

Monitoring Services

```
Prometheus
Port : 9090

Grafana
Port : 3001

Node Exporter
Port : 9100
```

Docker Compose was used to deploy the monitoring stack.

```
docker compose up -d
```

---

## Grafana Dashboard

Configured

- Prometheus Data Source

Created Dashboard displaying

- CPU Usage
- Memory Usage
- Node Metrics

Dashboard verifies real-time infrastructure monitoring.

---

# 📸 Screenshots Included

## Terraform

- Terraform Init
- Terraform Plan
- Terraform Apply
- AWS Resources Created

## Jenkins

- Jenkins Dashboard
- Jenkins Pipeline Success
- Console Output

## Docker

- Docker Build
- Docker Images
- Docker Containers

## DockerHub

- Docker Image Repository

## Kubernetes

- Running Pods
- Services
- LoadBalancer
- Application

## Monitoring

- Prometheus UI
- Grafana Login
- Grafana Dashboard
- Node Exporter Metrics
- Monitoring Containers

---

# 📈 Project Outcome

Successfully implemented a production-ready DevOps workflow including

- Infrastructure as Code using Terraform
- Automated Jenkins Installation
- Docker Containerization
- DockerHub Image Repository
- CI/CD Pipeline
- Amazon EKS Deployment
- Kubernetes Workloads
- GitHub Integration
- Open-source Monitoring using Prometheus
- Grafana Dashboard Visualization

---

# ✅ Features

✔ Infrastructure as Code

✔ Automated Jenkins Installation

✔ Automated CI/CD Pipeline

✔ Dockerized Application

✔ DockerHub Integration

✔ Kubernetes Deployment

✔ Amazon EKS

✔ GitHub Integration

✔ Prometheus Monitoring

✔ Grafana Dashboard

✔ Production Ready Workflow

---

# 📚 Learning Outcomes

This project demonstrates hands-on experience with

- AWS Cloud
- Terraform
- Docker
- Jenkins
- DockerHub
- Kubernetes
- Amazon EKS
- GitHub Actions & Webhooks
- Prometheus
- Grafana
- Infrastructure Automation
- Continuous Integration
- Continuous Deployment
- Monitoring and Observability

---

# 👨‍💻 Author

**Lokesh D**

DevOps Engineer

GitHub:
https://github.com/dlokeshmech-glitch

---
