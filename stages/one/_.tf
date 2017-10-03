variable "database" {
  type = "map"
  default = {
    type = "db.t2.micro"
    password = "drowssap"
    username = "root"
    db_name = "airportdemo"
  }
}

variable "aws_route53_record_zone_id" {
  description = "aws_route53_record_zone_id"
  default = ""
}

variable "maintenance_instance" {
  type = "map"
  default = {
    type = "t2.micro"
  }
}