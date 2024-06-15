output "security_group_ids" {
  value = [aws_security_group.ec2_sg.id]
}
