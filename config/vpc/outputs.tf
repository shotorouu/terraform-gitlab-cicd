output "pb_sn" {
  description = "Public Subnet ID"
  value       = aws_subnet.pb_sn.id
}

output "sg" {
  description = "Security Group ID"
  value       = module.security_group.id
}
