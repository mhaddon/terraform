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
  final_snapshot_identifier  = "airportdemo-db-${md5(timestamp())}"
  skip_final_snapshot        = true

  publicly_accessible        = true
}