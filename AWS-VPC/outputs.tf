output "subnet_id" {
  value       = aws_subnet.subnet.id
  sensitive   = false
  description = "ID da Subnet criada"
  depends_on  = [aws_subnet.subnet]
}

output "security_group_id" {
  value       = aws_security_group.security_group.id
  sensitive   = false
  description = "ID da Security Group criada"
  depends_on  = [aws_security_group.security_group]
}

