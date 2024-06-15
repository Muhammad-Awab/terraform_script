output "instance_id" {
  value = aws_instance.j_web.id
}

output "instance_public_ip" {
  value = aws_eip.jweb_e_ip.public_ip
}
