resource "aws_db_instance" "default" {
  allocated_storage          = 5
  storage_type               = "gp2"
  availability_zone          = "${data.aws_availability_zones.available.names[0]}"
  engine                     = "mysql"
  engine_version             = "5.6.35"
  instance_class             = "db.t2.micro"
  license_model              = "general-public-license"
  name                       = "airportdemo"
  username                   = "root"
  password                   = "drowssap"
  final_snapshot_identifier  = "airportdemo-o-db"
//  publicly_accessible        = true
  db_subnet_group_name       = "${aws_db_subnet_group.default.id}"
}