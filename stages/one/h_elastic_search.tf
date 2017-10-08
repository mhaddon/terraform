data "template_file" "elasticsearch_server" {
  template = "${file("elasticsearch_init.yml")}"

  vars {
    image_name        = "${var.elasticsearch_images["docker_image"]}"
  }
}

resource "aws_instance" "elasticsearch_server" {
  ami                     = "${data.aws_ami.coreos.id}"
  instance_type           = "${var.elasticsearch_images["instance_type"]}"
  subnet_id               = "${element(aws_subnet.ec2.*.id, 0)}"
  vpc_security_group_ids  = ["${aws_security_group.allow_all.id}"]
  key_name                = "aws_test"
  user_data               = "${data.template_file.elasticsearch_server.rendered}"

  tags {
    Name="elastic_search"
  }
}