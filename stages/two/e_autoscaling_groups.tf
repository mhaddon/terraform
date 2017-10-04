

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = ["${data.terraform_remote_state.output.subnet_primary}"]
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = "${var.coreos_images["min_count"]}"
  max_size             = "${var.coreos_images["max_count"]}"

  lifecycle {
    create_before_destroy = true
  }
}