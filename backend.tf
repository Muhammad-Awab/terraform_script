terraform {
  backend "s3" {
    bucket = "static-bucket1"
    key    = "tfstate"
    region = "us-east-1"
  }
}
