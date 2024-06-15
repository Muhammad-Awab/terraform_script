variable "vpc_id" {
  type    = string
  default = "vpc-0f282b3369573ef23"
}

variable "subnet_id" {
  type    = string
  default = "subnet-00e058612c3b57325"
}

variable "security_group_name" {
  type    = string
}


variable "ec2_key_name" {
  type        = string
  description = "Key pair name"
  default     = "front"
}

variable "ec2_public_key_path" {
  type        = string
  description = "Path to the public key file"
  default     = "./front.pub"
}

variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ec2_base_ami" {
  type    = string
  default = "ami-04b70fa74e45c3917"
}
