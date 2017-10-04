data "template_file" "maintenaince" {
  template = "${file("init.conf")}"

  vars {
    database_endpoint = "${aws_db_instance.default.address}"
    database_name     = "${aws_db_instance.default.name}"
    database_username = "${aws_db_instance.default.username}"
    database_password = "${aws_db_instance.default.password}"
    database_port     = "${aws_db_instance.default.port}"
  }
}

data "template_cloudinit_config" "master" {
  gzip          = false
  base64_encode = false
  part {
    content_type = "text/cloud-config"
    content = "${data.template_file.maintenaince.rendered}"
    merge_type   = "dict(recurse_array)+list(append)"
  }
}

resource "aws_instance" "maintenance" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.maintenance_instance["type"]}"
  subnet_id = "${aws_subnet.maintenance.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  key_name = "aws_test"
  associate_public_ip_address = true
  user_data          = "${data.template_cloudinit_config.master.rendered}"

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
    source      = "../../mysql/airportdemo.sql"
    destination = "/tmp/database.sql"
  }

  tags {
    name="maintenance"
  }
}