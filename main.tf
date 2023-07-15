#######
# AWS #
#######
# Create a new VPC
resource "aws_vpc" "verpaxvpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a new subnet within the VPC
resource "aws_subnet" "private-subenet" {
  vpc_id                  = aws_vpc.verpaxvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
}

resource "aws_subnet" "public-subenet" {
  vpc_id                  = aws_vpc.verpaxvpc.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "us-east-2b"
}

# Create an internet gateway for the VPC
resource "aws_internet_gateway" "verpax-igw" {
  vpc_id = aws_vpc.verpaxvpc.id
}

# Create a route table and associate it with the public-subnet
resource "aws_route_table" "verpaxpubrtb" {
  vpc_id = aws_vpc.verpaxvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.verpax-igw.id
  }
}

# Create a route table and associate it with the private-subnet
resource "aws_route_table" "verpaxpvtrtb" {
  vpc_id = aws_vpc.verpaxvpc.id

# Associate the route table with the public-subnet
resource "aws_route_table_association" "verpaxpubrtb-asso" {
  subnet_id      = aws_subnet.public-subenet.id
  route_table_id = aws_route_table.verpaxpubrtb.id
}

# Associate the route table with the private-subnet
resource "aws_route_table_association" "verpaxpvtrtb-asso" {
  subnet_id      = aws_subnet.private-subenet.id
  route_table_id = aws_route_table.verpaxpvtrtb.id
}

# Create a security group for the RDS instance
resource "aws_security_group" "verpaxsg" {
  vpc_id = aws_vpc.verpaxvpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an RDS PostgreSQL instance
resource "aws_db_instance" "verpaxdb" {
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  identifier        = "verpaxdb-pg"
  name              = "verpaxdb-pg"
  username          = "admin"
  password          = "password123"
  vpc_security_group_ids = [aws_security_group.verpaxsg.id]
  db_subnet_group_name  = aws_subnet.private-subnet.id
}
