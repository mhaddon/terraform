resource "aws_route53_record" "www" {
  zone_id = ""
  name    = "db.devops-training.lunatech.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_db_instance.default.endpoint}"]
}