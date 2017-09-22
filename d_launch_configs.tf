resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-e2d33d98"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}