variable "coreos_images" {
  type = "map"
  default = {
    instance_type = "t2.micro"
    min_count = 4
    max_count = 4
  }
}