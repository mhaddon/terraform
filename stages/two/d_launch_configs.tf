resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "${data.aws_ami.coreos.id}"
  instance_type = "${var.coreos_images["instance_type"]}"
  key_name      = "aws_test"
  security_groups = ["${data.terraform_remote_state.output.aws_security_group_allow_all}"]

  lifecycle {
    create_before_destroy = true
  }
}

