resource "aws_autoscaling_group" "bar" {
//  vpc_zone_identifier = ["${data.terraform_remote_state.output.subnet_primary}", "${data.terraform_remote_state.output.subnet_secondary}"]
  vpc_zone_identifier = ["${data.terraform_remote_state.output.subnet_primary}"]
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = 2
  max_size             = 2

  lifecycle {
    create_before_destroy = true
  }
}