##################
# AWS POSTGRESQL #
##################
variable "aws_pg_db_name" {
  type        = string
  default = "verpax_db"
}

variable "aws_pg_allocated_storage" {
  type        = number
  default = 10
}

variable "aws_pg_engine" {
    type = string
    default = "postgres"
}

variable "aws_pg_engine_version" {
    type = string
    default = "14.7"
}

variable "aws_pg_instance_class" {
    type = string
    default = "db.t3.micro"
}

variable "aws_pg_username"{
    type = string
    default = "verpaxllc"
}

variable "aws_pg_password" {
  type = string
  default= "verpaxadmin"
}