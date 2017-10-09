variable "coreos_images" {
  type = "map"
  default = {
    instance_type = "t2.micro"
    docker_image = "danielalarcao/airport-spring-boot-docker_webapp"
    min_count = 2
    max_count = 2
  }
}

variable "aws_route53_record_zone_id" {
  description = "aws_route53_record_zone_id"
  default = ""
}