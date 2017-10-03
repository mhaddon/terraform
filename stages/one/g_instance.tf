resource "aws_instance" "maintenance" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.maintenance_instance["type"]}"
  subnet_id = "${aws_subnet.maintenance.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  key_name = "aws_test"
  associate_public_ip_address = true
  user_data          = "${file("init.conf")}"

  connection {
    user = "ubuntu"
    private_key = "${file("aws_test2.pem")}"
    agent = false
  }

  provisioner "file" {
    source      = "aws_test2.pem"
    destination = "/tmp/aws_test.pem"
  }

  provisioner "file" {
    source      = "../../../mysql/airportdemo.sql"
    destination = "aws_test2.pem"
  }

  tags {
    name="maintenance"
  }
}