# gitea-on-aws-with-terraform

# 🐳 Gitea Deployment on AWS with Terraform

This project demonstrates how to deploy a self-hosted Git service, **Gitea**, on AWS EC2 using Docker. It also includes plans to automate the infrastructure provisioning using **Terraform**, with HTTPS access through an **Application Load Balancer (ALB)** and **custom domain**.

---

## 🧰 Tech Stack

- AWS EC2 (Amazon Linux 2)
- Docker
- Gitea (via Docker container)
- Application Load Balancer (ALB)
- Amazon Certificate Manager (ACM)
- Freenom / GoDaddy custom domain (CNAME mapped)
- Terraform (Infrastructure as Code)

---

## 📌 Current Status

- ✅ EC2 instance manually provisioned
- ✅ Docker and Gitea installed manually
- ✅ Gitea accessible at `http://<EC2_PUBLIC_IP>:3000`
- ⏳ ALB + HTTPS configuration in progress
- ⏳ Terraform automation in development

---

## 📂 Directory Structure

