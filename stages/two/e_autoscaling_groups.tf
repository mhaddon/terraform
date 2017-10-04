data "template_file" "coreos" {
  template = "${file("init.conf")}"

  vars {
    database_endpoint = "jdbc:mysql://${data.terraform_remote_state.output.db_endpoint}/${data.terraform_remote_state.output.db_name}?autoReconnect=true&useSSL=false&serverTimezone=UTC"
  }
}

data "template_cloudinit_config" "master" {
  gzip          = false
  base64_encode = false

  part {
    content = "${data.template_file.coreos.rendered}"
  }
}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = ["${data.terraform_remote_state.output.subnet_primary}"]
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = "${var.coreos_images["min_count"]}"
  max_size             = "${var.coreos_images["max_count"]}"
  user_data            = "${data.template_cloudinit_config.master.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}