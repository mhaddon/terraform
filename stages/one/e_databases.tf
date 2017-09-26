resource "aws_db_instance" "default" {
  allocated_storage          = 5
  storage_type               = "gp2"
  engine                     = "mysql"
  engine_version             = "5.6.35"
  instance_class             = "db.t2.micro"
  license_model              = "general-public-license"
  name                       = "airportdemo"
  username                   = "root"
  password                   = "drowssap"
  final_snapshot_identifier  = "airportdemo-o-db"
  publicly_accessible        = true
  vpc_security_group_ids     = ["${aws_db_security_group.allow_all.id}"]
}