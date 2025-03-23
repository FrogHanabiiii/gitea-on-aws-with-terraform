#!/bin/bash
# Install Docker
yum update -y
amazon-linux-extras enable docker
yum install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Create data directory
mkdir -p /home/ec2-user/gitea/data
chown -R ec2-user:ec2-user /home/ec2-user/gitea

# Run Gitea container with proper ROOT_URL
sudo docker run -d --name=gitea \
  --restart=always \
  -p 3000:3000 \
  -v /home/ec2-user/gitea/data:/data \
  -e USER_UID=1000 \
  -e USER_GID=1000 \
  -e GITEA__server__ROOT_URL=https://www.aurafish.space/ \
  gitea/gitea:latest