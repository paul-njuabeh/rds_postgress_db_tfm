#######
# AWS #
#######
resource "aws_db_instance" "aws_rds_postgres" {
  allocated_storage    = var.aws_pg_allocated_storage
  db_name              = var.aws_pg_db_name
  engine               = var.aws_pg_engine
  engine_version       = var.aws_pg_engine_version
  instance_class       = var.aws_pg_instance_class
  username             = var.aws_pg_username
  password             = var.aws_pg_password

  skip_final_snapshot  = true
  apply_immediately = true
  publicly_accessible = true
}
