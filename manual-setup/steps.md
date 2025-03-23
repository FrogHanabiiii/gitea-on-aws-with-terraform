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

- sudo yum update -y
- sudo amazon-linux-extras enable docker
- sudo yum install docker -y
- sudo service docker start
- sudo systemctl enable docker
- sudo usermod -aG docker ec2-user

| Re-ssh for docker group access.

---

## 📁 4. Run Gitea Container

- mkdir -p ~/gitea/data #create directory for gitea

- docker run -d --name=gitea \
   -p 3000:3000 \
   -v ~/gitea/data:/data \
   -gitea/gitea:latest

---

## 🌐 5. Access Gitea Web Interface
URL: http://<EC2_PUBLIC_IP>:3000

Expected: Gitea welcome screen (initial setup)

📸 Screenshot:
(See /manual-setup/screenshots/gitea-home.png)

---

## 🌍 6. Set Up Domain and HTTPS

This section explains how to make Gitea accessible over HTTPS via a custom domain using AWS Application Load Balancer (ALB), ACM certificate, and GoDaddy DNS.

---

### 🔗 6.1 Using Domain & Create SSL Certificate (ACM)

- **Domain Registrar**: GoDaddy  
- **Domain Used**: `aurafish.space`
- Requested a **public SSL certificate** via **AWS Certificate Manager**
- Included:
  - `aurafish.space`
  - `www.aurafish.space`
- **Validation Method**: DNS validation
  - Added two CNAME records in GoDaddy as provided by AWS
- Certificate status: ✅ **Issued**

---

### 📦 6.2 Create Target Group

- **Target Type**: instance
- **Protocol**: HTTP
- **Port**: 3000
- **Health Check Path**: `/`
- **Registered Target**: EC2 instance with Gitea running

---

### 🧩 6.3 Create Application Load Balancer (ALB)

- **Type**: Internet-facing
- **Protocol**: HTTPS (port 443)
- **Subnets**: Two public subnets across different Availability Zones
- **Listener**: HTTPS (443)
  - Forward to the above target group
  - Attached ACM certificate for `www.aurafish.space`
- **Security Group for ALB**:
  - TCP 80 (HTTP)
  - TCP 443 (HTTPS)

---

### 🧭 6.4 Configure GoDaddy DNS

- **CNAME Record**:
  - **Name**: `www`
  - **Value**: ALB DNS name (e.g. `gitea-alb-xxx.ap-southeast-1.elb.amazonaws.com`)
- **Domain Forwarding**:
  - **From**: `aurafish.space`
  - **To**: `https://www.aurafish.space`
  - **Type**: Permanent (301)
  - **Masking**: Disabled

---

### ✅ 6.5 Final Result

- Gitea is accessible via HTTPS at:  
  `https://www.aurafish.space`
- Domain forwarding ensures both `aurafish.space` and `www.aurafish.space` work
- Browser shows 🔒 secure connection with valid SSL certificate

---

### 📸 Screenshot

- See `/manual-setup/screenshots/domain-https-success.png`
