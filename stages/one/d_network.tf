resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "int_gw"
  }
}

resource "aws_eip" "primary_eip" {
  count = "${length(data.aws_availability_zones.available.names)-1}"
  vpc = true
}

resource "aws_subnet" "nat" {
  cidr_block = "172.16.100.0/24"
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "Public nat subnet"
  }
}

resource "aws_nat_gateway" "primary_nat" {
  count = "${length(data.aws_availability_zones.available.names)-1}"
  allocation_id = "${element(aws_eip.primary_eip.*.id,count.index)}"
  //  subnet_id = "${element(aws_subnet.ec2_subnet.*.id,count.index)}"
  subnet_id = "${aws_subnet.nat.id}"
  depends_on = ["aws_internet_gateway.default"]
}

resource "aws_subnet" "maintenance" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "172.16.200.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "tf_sub_maintenance"
  }
}

resource "aws_subnet" "ec2_subnet" {
  count =  "${length(data.aws_availability_zones.available.names)-1}"
  cidr_block = "172.16.${((count.index)+1)*10}.0/24"
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "tf_subnet_${count.index}"
  }
}

resource "aws_db_subnet_group" "database" {
  name       = "main"
  subnet_ids = ["${aws_subnet.ec2_subnet.*.id}","${aws_subnet.maintenance.id}"]

  tags {
    Name = "My DB subnet group"
  }
}