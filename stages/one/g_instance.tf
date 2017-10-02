resource "aws_instance" "maintenance" {
  ami = "ami-10547475"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.maintenance.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  key_name = "aws_test"
  associate_public_ip_address = true
  tags {
    name="maintenance"
  }
}

//resource "aws_network_interface" "test" {
//  subnet_id       = "${aws_subnet.primary.id}"
//  security_groups = ["${aws_security_group.allow_all.id}"]
//  attachment {
//    instance     = "${aws_instance.maintenance.id}"
//    device_index = 1
//  }
//}