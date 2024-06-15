terraform {
  backend "s3" {
    bucket = "static-bucket1"
    key    = "tfstate"
    region = "us-east-1"
  }
}
module "vpc" {
  source = "./modules/vpc"
  vpc_id = var.vpc_id
}

module "subnet" {
  source   = "./modules/subnet"
  subnet_id = var.subnet_id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = var.vpc_id
  security_group_name = var.security_group_name
}

module "key_pair" {
  source          = "./modules/key_pair"
  key_name        = var.ec2_key_name
  public_key_path = var.ec2_public_key_path
}

module "ec2" {
  source          = "./modules/ec2"
  instance_type   = var.ec2_instance_type
  base_ami        = var.ec2_base_ami
  subnet_id       = var.subnet_id
  security_groups = module.security_group.security_group_ids
  availability_zone = var.availability_zone
  instance_name   = var.instance_name
  key_name        = module.key_pair.key_name
}

module "ecr" {
  source = "./modules/ecr"
}

module "eip" {
  source = "./modules/eip"
  eip_name = var.eip_name
  instance_id = module.ec2.instance_id
}
