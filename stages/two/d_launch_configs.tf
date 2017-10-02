resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-9e3c66fb"
  instance_type = "t2.micro"
  key_name = "aws_test"
  security_groups = ["${data.terraform_remote_state.output.aws_security_group_allow_all}"]

  lifecycle {
    create_before_destroy = true
  }
}

