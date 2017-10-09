variable "database" {
  type = "map"
  default = {
    type = "db.t2.micro"
    password = "drowssap"
    username = "root"
    db_name = "lunatech"
  }
}

variable "maintenance_instance" {
  type = "map"
  default = {
    type = "t2.micro"
  }
}