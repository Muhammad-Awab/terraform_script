
resource "aws_instance" "j_web" {
  ami                         = var.base_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  key_name                    = var.key_name
  security_groups             = var.security_groups
  subnet_id                   = var.subnet_id

  user_data = <<-EOF
                #!/bin/bash
                apt-get update
                apt-get install nginx -y
                apt-get install -y docker.io docker-compose certbot
                usermod -aG docker ubuntu
                newgrp docker
                mkdir -p /etc/nginx/config /etc/nginx/ssl/live/jay.eitaa.in /var/www/certbot
                echo "${var.nginx_conf}" > /etc/nginx/config/jay.eitaa.in.conf
                echo "${var.ssl_certificate}" > /etc/nginx/ssl/live/jay.eitaa.in/fullchain.pem
                echo "${var.ssl_certificate_key}" > /etc/nginx/ssl/live/jay.eitaa.in/privkey.pem
                sudo systemctl reload nginx
              EOF

  tags = {
    Name = var.instance_name
  }
}

resource "aws_eip" "jweb_e_ip" {
  instance = aws_instance.j_web.id
  domain   = "vpc"
  tags = {
    Name = "j_web_e_ip"
  }
}

