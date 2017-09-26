resource "aws_vpc" "db_vpc" {
  cidr_block = "172.16.0.0/16"
  default_security_group_id = "${aws_security_group.allow_all.id}"
  tags {
    Name = "tf-db"
  }
}