resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true
  // default_route_table_id = "${aws_route_table.default_route_table.id}"

  tags {
    Name = "tf_mt_vpc"
  }
}

data "aws_availability_zones" "available" {}




