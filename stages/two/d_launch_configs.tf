data "template_file" "coreos_slave" {
  template = "${file("server_init.yml")}"

  vars {
    database_endpoint                 = "jdbc:mysql://${data.terraform_remote_state.output.db_endpoint}/${data.terraform_remote_state.output.db_name}?autoReconnect=true&useSSL=false&serverTimezone=UTC"
    database_password                 = "${data.terraform_remote_state.output.db_password}"
    database_username                 = "${data.terraform_remote_state.output.db_username}"
    image_name                        = "${var.coreos_images["docker_image"]}"
    elastic_search_server_hosts       = "http://${data.terraform_remote_state.output.elastic_search_server_ip}:9200"
    elastic_search_server_username    = ""
    elastic_search_server_password    = ""
  }
}

resource "aws_launch_configuration" "coreos_slave" {
  name            = "web_config"
  image_id        = "${data.aws_ami.coreos.id}"
  instance_type   = "${var.coreos_images["instance_type"]}"
  key_name        = "aws_test"
  security_groups = ["${data.terraform_remote_state.output.aws_security_group_allow_all}"]
  user_data       = "${data.template_file.coreos_slave.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

