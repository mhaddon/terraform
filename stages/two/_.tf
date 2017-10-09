variable "coreos_images" {
  type = "map"
  default = {
    instance_type = "t2.small"
    docker_image = "mhaddon/airportdemo:latest"
    min_count = 2
    max_count = 4
  }
}

variable "aws_route53_record_zone_id" {
  description = "aws_route53_record_zone_id"
  default = ""
}

variable "subdomain" {
  default = "michael"
}