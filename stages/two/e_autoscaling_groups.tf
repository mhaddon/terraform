resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = ["${aws_subnet.primary.id}", "${aws_subnet.secondary.id}"]
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = 4
  max_size             = 8

  lifecycle {
    create_before_destroy = true
  }
}