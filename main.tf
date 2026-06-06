provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "jenkins_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.medium"

  key_name = "devopskey"

  user_data = file("jenkins-install.sh")

  tags = {
    Name = "Terraform-Jenkins-Server"
  }
}
