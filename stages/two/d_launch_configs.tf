resource "aws_launch_configuration" "as_conf" {
  name          = "web_config"
  image_id      = "ami-4ad13527"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }

  user_data = "${file("docker.yml")}}"
}