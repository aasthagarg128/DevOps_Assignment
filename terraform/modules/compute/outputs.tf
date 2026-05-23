output "api_public_ip" {
  value = aws_instance.api.public_ip
}

output "worker_private_ips" {
  value = aws_instance.worker[*].private_ip
}