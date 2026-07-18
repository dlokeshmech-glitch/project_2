#!/bin/bash

# Update Ubuntu
apt-get update -y

# Install Git
apt-get install -y git

# Install Docker
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

# Install Java
apt-get install -y openjdk-17-jdk

# Install curl
apt-get install -y curl

# Add Jenkins Repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
apt-get update -y
apt-get install -y jenkins

# Start Jenkins
systemctl enable jenkins
systemctl start jenkins
