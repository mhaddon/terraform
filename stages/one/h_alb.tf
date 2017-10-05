resource "aws_alb" "test" {
  name = "test-alb-tf"
  internal = false
  security_groups = ["${aws_security_group.allow_all.id}"]
  subnets = ["${aws_subnet.ec2_subnet.*.id}"]

  enable_deletion_protection = false

}

resource "aws_alb_target_group" "test" {
  port = 3000
  protocol = "HTTP"
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_alb_listener" "test" {
  "default_action" {
    target_group_arn = "${aws_alb_target_group.test.arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_alb.test.arn}"
  port = 80
}

resource "aws_route53_record" "www" {
  zone_id = "${var.aws_route53_record_zone_id}"
  name    = "daniel.devops-training.lunatech.com"
  type    = "A"
  alias {
    evaluate_target_health = false
    name = "${aws_alb.test.dns_name}"
    zone_id = "${aws_alb.test.zone_id}"
  }
}