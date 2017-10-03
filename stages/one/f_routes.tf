//resource "aws_route53_record" "www" {
//  zone_id = "${var.aws_route53_record_zone_id}"
//  name    = "db.devops-training.lunatech.com"
//  type    = "CNAME"
//  ttl     = "300"
//  records = ["${aws_instance.maintenance.public_ip}"]
//}


resource "aws_route" "default" {
  route_table_id = "${aws_vpc.my_vpc.default_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}

resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  count = "${(length(data.aws_availability_zones.available.names)-1)}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.primary_nat.*.id,count.index)}"
  }
}

resource "aws_route_table_association" "nat" {
  count = "${(length(data.aws_availability_zones.available.names)-1)}"
  route_table_id = "${element(aws_route_table.nat.*.id,count.index)}"
  subnet_id = "${element(aws_subnet.ec2_subnet.*.id,count.index)}"
}