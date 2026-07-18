########################
# VPC
########################

resource "aws_vpc" "jenkins_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "jenkins-vpc"
  }
}

########################
# Subnet
########################

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

########################
# Internet Gateway
########################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = "jenkins-igw"
  }
}

########################
# Route Table
########################

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

########################
# Security Group
########################

resource "aws_security_group" "jenkins_sg" {
  name   = "jenkins-sg"
  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################
# IAM Role
########################

resource "aws_iam_role" "ec2_role" {
  name = "jenkins-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "jenkins-profile"
  role = aws_iam_role.ec2_role.name
}

########################
# EC2
########################

resource "aws_instance" "jenkins_server" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  key_name = var.key_name

  user_data = file("jenkins-install.sh")

  tags = {
    Name = "Terraform-Jenkins-Server"
  }
}