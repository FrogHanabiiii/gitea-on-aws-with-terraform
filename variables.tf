variable "aws_region" {
  description = "AWS region to deploy to"
  default     = "ap-southeast-1"
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "vpc_id" {
  description = "VPC ID for the instance"
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
}

variable "public_subnet_ids" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "acm_certificate_arn" {
  description = "ARN of the validated ACM certificate for HTTPS"
}
