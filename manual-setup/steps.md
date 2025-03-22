# 🛠️ Manual Deployment: Gitea on EC2 (Amazon Linux 2)

This document outlines the manual setup steps for deploying Gitea on an Amazon EC2 instance using Docker.

---

## 🚀 1. Launch EC2 Instance

- **AMI**: Amazon Linux 2 (HVM)
- **Type**: t2.micro
- **Key Pair**: Created for ssh purpose
- **Public IP**: Enabled
- **Security Group Inbound Rules**:
  - TCP 22 – SSH
  - TCP 3000 – Gitea Web
  - TCP 80 & 443 – For ALB/HTTPS

---

## 🔐 2. Connect via SSH

bash:
ssh -i my-key.pem ec2-user@<EC2_PUBLIC_IP>

---

## 🐳 3. Install Docker

sudo yum update -y
sudo amazon-linux-extras enable docker
sudo yum install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

| Re-ssh for docker group access.

---

## 📁 4. Run Gitea Container

mkdir -p ~/gitea/data #create directory for gitea

docker run -d --name=gitea \
  -p 3000:3000 \
  -v ~/gitea/data:/data \
  gitea/gitea:latest

---

## 🌐 5. Access Gitea Web Interface
URL: http://<EC2_PUBLIC_IP>:3000

Expected: Gitea welcome screen (initial setup)

📸 Screenshot:
(See /manual-setup/screenshots/gitea-home.png)
