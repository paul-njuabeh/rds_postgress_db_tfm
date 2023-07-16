#######
# AWS #
#######

# Create an RDS PostgreSQL instance
# Create a subnet group for the RDS instance
resource "aws_db_subnet_group" "verpaxdb_subnet_group" {
  name        = "verpaxdb-subnet-group"
  description = "Subnet group for the verpaxdb DB instance"

  subnet_ids = [
    aws_subnet.myapp-subnet.id,
    aws_subnet.myapp-subnet1.id
  ]
}

resource "aws_db_instance" "verpaxdb" {
  db_name               = "db_verpaxdb"
  engine                = "postgres"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  identifier            = "verpaxdb"
  username              = var.username
  password              = var.password
  skip_final_snapshot   = false
  final_snapshot_identifier = "verpaxdb-final-snapshot-2"
  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  db_subnet_group_name  = aws_db_subnet_group.verpaxdb_subnet_group.id
}
