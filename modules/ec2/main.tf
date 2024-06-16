

resource "aws_instance" "j_web" {
  ami                         = var.base_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  key_name                    = var.key_name
  security_groups             = var.security_groups
  subnet_id                   = var.subnet_id

  user_data = <<EOF
#!/bin/bash
set -e

# Update and install necessary packages

apt-get update
                apt-get install nginx -y
                apt-get install -y docker.io docker-compose certbot
                usermod -aG docker ubuntu
                newgrp docker
sudo systemctl reload nginx



EOF

  tags = {
    Name = var.instance_name
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo mkdir -p /etc/nginx/config /etc/nginx/ssl/live/jay.eitaa.in /var/www/certbot",
      "sudo chown -R ubuntu:ubuntu /var/www/certbot",
      "sudo chown -R ubuntu:ubuntu /etc/nginx/ssl/live/jay.eitaa.in",
      "sudo chown -R ubuntu:ubuntu /etc/nginx/config"

    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }


  provisioner "file" {
    source      = var.nginx_conf_path
    destination = "/etc/nginx/config/jay.eitaa.in.conf"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }

  }

  provisioner "file" {
    source      = var.ssl_certificate_path
    destination = "/etc/nginx/ssl/live/jay.eitaa.in/fullchain.pem"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = var.ssl_certificate_key_path
    destination = "/etc/nginx/ssl/live/jay.eitaa.in/privkey.pem"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }


}

resource "aws_eip" "jweb_e_ip" {
  instance = aws_instance.j_web.id
  domain   = "vpc"
  tags = {
    Name = "j_web_e_ip"
  }
}
