output "db_vpc_id" {
  value = "${aws_vpc.default.id}"
}
output "subnet_primary" {
  value = "${aws_subnet.ec2.*.id}"
}
//output "subnet_secondary" {
//  value = "${aws_subnet.secondary.id}"
//}
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
//output "db_endpoint" {
//  value = "${aws_db_instance.default.endpoint}"
//}
//output "route53_id" {
//  value = "${aws_route53_record.www.id}"
//}