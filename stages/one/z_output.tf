output "db_vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "subnet_primary" {
  value = "${aws_subnet.ec2.*.id}"
}
output "subnet_elb" {
  value = "${aws_subnet.elb.*.id}"
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
output "elastic_search_server_ip" {
  value = "${aws_instance.elasticsearch_server.private_ip}"
}
output "net_subnet" {
  value = "${aws_subnet.nat.id}"
}
//output "route53_id" {
//  value = "${aws_route53_record.www.id}"
//}