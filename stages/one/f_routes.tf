resource "aws_route" "default" {
  route_table_id = "${aws_vpc.default.default_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}

resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.default.id}"
  count = "${(length(data.aws_availability_zones.available.names)-1)}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.public.*.id,count.index)}"
  }
}

resource "aws_route_table_association" "nat" {
  count = "${(length(data.aws_availability_zones.available.names)-1)}"
  route_table_id = "${element(aws_route_table.nat.*.id,count.index)}"
  subnet_id = "${element(aws_subnet.ec2.*.id,count.index)}"
}