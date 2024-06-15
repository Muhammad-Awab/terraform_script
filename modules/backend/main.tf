provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = var.bucket_name
    key    = var.tfstate_key
    region = var.region
  }
}
