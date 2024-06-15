resource "aws_eip" "jweb_e_ip" {
  instance = var.instance_id
  domain   = "vpc"
  tags = {
    Name = var.eip_name
  }
}
