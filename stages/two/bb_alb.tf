//resource "aws_alb" "test" {
//  name = "test-alb-tf"
//  internal = true
//  security_groups = ["${data.terraform_remote_state.output.security_group_id}"]
//  subnets = ["${data.terraform_remote_state.output.subnet_primary}"]
//
//  enable_deletion_protection = false
//
//}
//
//resource "aws_alb_target_group" "test" {
//  port = 8080
//  protocol = "HTTP"
//  vpc_id = "${data.terraform_remote_state.output.db_vpc_id}"
//}
//
//resource "aws_alb_listener" "test" {
//  "default_action" {
//    target_group_arn = "${aws_alb_target_group.test.arn}"
//    type = "forward"
//  }
//  load_balancer_arn = "${aws_alb.test.arn}"
//  port = 80
//}

resource "aws_elb" "test" {
  subnets                   = ["${data.terraform_remote_state.output.subnet_elb}"]
  security_groups           = ["${data.terraform_remote_state.output.security_group_id}"]
//  cross_zone_load_balancing = true
//  availability_zones  = ["${data.aws_availability_zones.available.names}"]

  "listener" {
    instance_port = 8080
    instance_protocol = "HTTP"
    lb_port = 80
    lb_protocol = "HTTP"
  }
}
resource "aws_route53_record" "www" {
  zone_id = "${var.aws_route53_record_zone_id}"
  name    = "${var.subdomain}.devops-training.lunatech.com"
  type    = "A"

  alias {
    evaluate_target_health = false
    name = "${aws_elb.test.dns_name}"
    zone_id = "${aws_elb.test.zone_id}"
  }
}