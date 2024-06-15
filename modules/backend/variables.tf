variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket to store Terraform state"
}

variable "tfstate_key" {
  type        = string
  description = "Key name for the Terraform state file in the S3 bucket"
}

variable "region" {
  type        = string
  description = "AWS region where the S3 bucket resides"
}
