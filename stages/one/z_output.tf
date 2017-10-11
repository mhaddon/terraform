output "db_vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "subnet_primary" {
  value = "${aws_subnet.ec2.*.id}"
}
output "subnet_ig" {
  value = "${aws_subnet.internet_subnets.*.id}"
}
output "security_group_id"{
  value = "${aws_security_group.allow_all.id}"
}
output "subnet_maintenance" {
  value = "${aws_subnet.maintenance.id}"
}
output "maintennace_instance" {
  value = "${aws_instance.maintenance.id}"
}
output "aws_security_group_allow_all" {
  value = "${aws_security_group.allow_all.id}"
}

//output "db_id" {
//  value = "${aws_db_instance.default.id}"
//}
output "db_endpoint" {
  value = "${aws_db_instance.default.endpoint}"
}
output "db_name" {
  value = "${aws_db_instance.default.name}"
}
output "db_password" {
  value = "${aws_db_instance.default.password}"
}
output "db_username" {
  value = "${aws_db_instance.default.username}"
}

output "nat_subnet" {
  value = "${aws_subnet.nat.id}"
}