resource "aws_instance" "maintenance" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.maintenance_instance["type"]}"
  subnet_id = "${aws_subnet.maintenance.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  key_name = "aws_test"
  associate_public_ip_address = true

  tags {
    name="maintenance"
  }
}