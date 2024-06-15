variable "instance_type" {
  type = string
}

variable "base_ami" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "availability_zone" {
  description = "The availability zone for launching the EC2 instance"
 
}
variable "instance_name" {
  description = "The name of the EC2 instance"
}