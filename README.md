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
- GoDaddy custom domain (My own domain name: aurafish.space)
- Terraform (Infrastructure as Code)

---

## 📂 Final Goal

Once completed, Gitea will be available at:

https://aurafish.space

Deployed automatically with:
- Terraform-managed EC2
- ALB + ACM (HTTPS)
- Domain name via GoDaddy

---

## 👨‍💻 Author

Royston Liu Xin Shen

AWS Certified | Cloud & DevOps Enthusiast 


