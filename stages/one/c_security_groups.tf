resource "aws_db_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    cidr = "80.113.34.59/32"
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["80.113.34.59/32"]
  }

  tags {
    Name = "allow_all"
  }
}