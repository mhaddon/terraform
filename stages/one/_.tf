variable "database" {
  type = "map"
  default = {
    type = "db.t2.micro"
    password = "drowssap"
    username = "root"
    db_name = "airportdemo"
  }
}

variable "maintenance_instance" {
  type = "map"
  default = {
    type = "t2.micro"
  }
}

variable "elasticsearch_images" {
  type = "map"
  default = {
    instance_type = "t2.small"
    docker_image = "elasticsearch:2.4.6"
  }
}
