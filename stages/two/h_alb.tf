resource "aws_alb" "test" {
  name = "test-alb-tf"
  internal = true
  security_groups = ["${data.terraform_remote_state.output.security_group_id}"]
  subnets = ["${data.terraform_remote_state.output.subnet_primary}"]
  
  enable_deletion_protection = false

}

resource "aws_alb_target_group" "test" {
  port = 8080
  protocol = "HTTP"
  vpc_id = "${data.terraform_remote_state.output.db_vpc_id}"
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
  name    = "${var.subdomain}.devops-training.lunatech.com"
  type    = "A"

  alias {
    evaluate_target_health = false
    name = "${aws_alb.test.dns_name}"
    zone_id = "${aws_alb.test.zone_id}"
  }
}