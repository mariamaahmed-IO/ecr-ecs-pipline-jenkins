/*
terraform {
  backend "s3" {
    bucket         = "WebAppbucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"  # Optional for locking
    encrypt        = true
  }
}
*/