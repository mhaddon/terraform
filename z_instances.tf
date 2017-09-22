//resource "aws_instance" "example" {
//  ami = "ami-efe09bf8"
//  instance_type = "t2.micro"
//  network_interface {
//    network_interface_id = "${aws_network_interface.foo.id}"
//    device_index = 0
//  }
//}