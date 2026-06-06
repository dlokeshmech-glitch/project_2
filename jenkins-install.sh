#!/bin/bash

yum update -y

yum install git docker -y

systemctl start docker
systemctl enable docker

yum install java-17-amazon-corretto -y

wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install jenkins -y

systemctl enable jenkins
systemctl start jenkins