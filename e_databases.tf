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
//  snapshot_identifier        = "airportdemo-db"
//  identifier                 = "airportdemo-db"
  final_snapshot_identifier  = "airportdemo-db-${md5(timestamp())}"
//  parameter_group_name       = "default.mysql5.6"
  skip_final_snapshot = true

  publicly_accessible        = true
//  apply_immediately = true
}

//resource "aws_db_snapshot" "test" {
//  db_instance_identifier = "${aws_db_instance.default.id}"
//  db_snapshot_identifier = "airportdemo-db"
//}

//data "aws_db_snapshot" "db_snapshot" {
//  most_recent = true
//  db_instance_identifier = "${aws_db_instance.default.identifier}"
//}
