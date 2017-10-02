provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "lunatech-devops-training-terraform-state"
    key    = "state"
    region = "us-east-1"
  }
}

