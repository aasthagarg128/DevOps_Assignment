output "api_sg_id" {
  value = aws_security_group.api_sg.id
}

output "worker_sg_id" {
  value = aws_security_group.worker_sg.id
}