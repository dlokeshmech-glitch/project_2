#!/bin/bash
set -e

apt-get update -y

apt-get install -y docker.io git curl

systemctl enable docker
systemctl start docker

docker pull jenkins/jenkins:lts

docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --restart unless-stopped \
  jenkins/jenkins:lts