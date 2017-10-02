data "aws_availability_zones" "available" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "lunatech-devops-training-terraform-state"
    key    = "state"
    region = "us-east-1"
  }
}

resource "archive_file" "" {
  output_path = ""
  type = "${data.terraform_remote_state.vpc.subnet_id}"
}