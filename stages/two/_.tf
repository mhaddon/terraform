variable "coreos_images" {
  type = "map"
  default = {
    instance_type = "t2.micro"
    docker_image = "mhaddon/airportdemo"
    min_count = 0
    max_count = 0
  }
}

variable "aws_route53_record_zone_id" {
  description = "aws_route53_record_zone_id"
  default = ""
}