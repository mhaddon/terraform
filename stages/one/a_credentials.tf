provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "lunatech-devops-training-terraform-state"
    key    = "state_aaa"
    region = "us-east-1"
  }
}