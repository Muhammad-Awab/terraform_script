output "backend_config" {
  value = {
    bucket = var.bucket_name
    key    = var.tfstate_key
    region = var.region
  }
}
