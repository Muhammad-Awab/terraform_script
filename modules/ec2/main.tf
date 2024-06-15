
resource "aws_instance" "j_web" {
  ami                         = var.base_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  key_name                    = var.key_name
  security_groups             = var.security_groups
  subnet_id                   = var.subnet_id

  user_data = <<-EOF
                #!/bin/bash
                apt-get update
                apt-get install -y docker.io
                usermod -aG docker ubuntu
                newgrp docker
              EOF

  tags = {
    Name = "j_web"
  }
}

resource "aws_eip" "jweb_e_ip" {
  instance = aws_instance.j_web.id
  domain   = "vpc"
  tags = {
    Name = "j_web_e_ip"
  }
}

