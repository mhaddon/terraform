data "template_file" "coreos_master" {
  template = "${file("init.yml")}"

  vars {
    database_endpoint = "jdbc:mysql://${data.terraform_remote_state.output.db_endpoint}/${data.terraform_remote_state.output.db_name}?autoReconnect=true&useSSL=false&serverTimezone=UTC"
    database_password = "${data.terraform_remote_state.output.db_password}"
    database_username = "${data.terraform_remote_state.output.db_username}"
    image_name        = "${var.coreos_images["docker_image"]}"
    master_ip         = "localhost"
    is_slave          = "false"
  }
}

resource "aws_instance" "coreos_master" {
  ami                     = "${data.aws_ami.coreos.id}"
  instance_type           = "${var.coreos_images["instance_type"]}"
  subnet_id               = "${data.terraform_remote_state.output.subnet_primary[0]}"
  vpc_security_group_ids  = ["${data.terraform_remote_state.output.aws_security_group_allow_all}"]
  key_name                = "aws_test"
  user_data               = "${data.template_file.coreos_master.rendered}"
  private_ip              = "172.16.10.100"

  tags {
    Name="coreos_master"
  }
}