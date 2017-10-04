data "aws_availability_zones" "available" {}

data "terraform_remote_state" "output" {
  backend = "s3"
  config {
    bucket = "${var.bucket}"
    key    = "state_one"
    region = "${var.region}"
  }
}

data "aws_ami" "coreos" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CoreOS-stable-1465*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["595879546273"] # CoreOS
}