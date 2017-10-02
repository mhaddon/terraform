resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"
  tags {
    Name = "tf-example"
  }
}

resource "aws_subnet" "primary" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "172.16.10.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "tf_primary"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "secondary" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "172.16.11.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags {
    Name = "tf_secondary"
  }
}

//resource "aws_network_interface" "foo" {
//  subnet_id = "${aws_subnet.my_subnet.id}"
//  private_ips = ["172.16.10.100"]
//  tags {
//    Name = "primary_network_interface"
//  }
//}