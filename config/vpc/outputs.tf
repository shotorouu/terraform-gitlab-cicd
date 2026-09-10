output "pb_sn" {
  value = aws_subnet.pb_sn.id
}

output "sg" {
  value = module.security_group.id
}
