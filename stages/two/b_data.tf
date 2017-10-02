data "aws_availability_zones" "available" {}

data "terraform_remote_state" "output" {
  backend = "s3"
  config {
    bucket = "lunatech-devops-training-terraform-state"
    key    = "state_aaa"
    region = "us-east-1"
  }
}