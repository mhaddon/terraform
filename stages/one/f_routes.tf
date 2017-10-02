resource "aws_route53_record" "db" {
  zone_id = "Z27UG1Z3HW6MGI"
  name    = "db.devops-training.lunatech.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_db_instance.default.endpoint}"]
}