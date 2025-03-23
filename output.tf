output "instance_public_ip" {
  value = aws_instance.gitea.public_ip
}

output "alb_dns_name" {
  value = aws_lb.gitea_alb.dns_name
}
