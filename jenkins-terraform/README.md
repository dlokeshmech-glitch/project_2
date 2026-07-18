# Jenkins Infrastructure Provisioning using Terraform

## Objective

Provision an AWS EC2 instance with Jenkins automatically using Terraform.

---

## Tools & Technologies

- Terraform
- AWS EC2
- AWS IAM
- AWS VPC
- Security Groups
- Ubuntu 24.04
- Jenkins
- Git

---

## Infrastructure Created

Terraform provisions the following AWS resources:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- IAM Role
- IAM Instance Profile
- EC2 Instance (Ubuntu)
- Elastic IP (Optional)

---

## Project Structure

```
terraform/
│── main.tf
│── variables.tf
│── outputs.tf
│── provider.tf
│── terraform.tfvars
```

---

## Security Group Ports

| Port | Purpose |
|------|---------|
| 22 | SSH Access |
| 8080 | Jenkins Web UI |
| 50000 | Jenkins Agent Communication |

---

## Terraform Commands

Initialize Terraform

```bash
terraform init
```

Validate Configuration

```bash
terraform validate
```

Preview Infrastructure

```bash
terraform plan
```

Create Infrastructure

```bash
terraform apply
```

Destroy Infrastructure

```bash
terraform destroy
```

---

## Jenkins Installation

Jenkins is installed automatically during EC2 provisioning using a user-data script.

Installation Steps:

- Install Java
- Install Jenkins
- Enable Jenkins service
- Start Jenkins service

Verify Jenkins Service

```bash
sudo systemctl status jenkins
```

Start Jenkins

```bash
sudo systemctl start jenkins
```

Enable Jenkins at Boot

```bash
sudo systemctl enable jenkins
```

---

## Access Jenkins

Open in browser

```
http://<EC2-PUBLIC-IP>:8080
```

Retrieve Initial Admin Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

---

## Verify Infrastructure

Check Terraform State

```bash
terraform show
```

List AWS Resources

```bash
terraform state list
```

---

## Expected Outcome

After successful execution:

- AWS infrastructure is provisioned automatically.
- Jenkins is installed and running on the EC2 instance.
- Jenkins is accessible through port **8080**.
- Infrastructure can be recreated or destroyed using Terraform commands.

---

## Screenshot Evidence

Include the following screenshots:

- Successful `terraform apply`
- AWS EC2 Instance
- Jenkins Web UI
- Jenkins Initial Dashboard
- `systemctl status jenkins`
- Terraform State Output
