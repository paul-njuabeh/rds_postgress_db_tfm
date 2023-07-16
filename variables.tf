variable "vpc_cidr_block" {}
variable "avail_zone_a" {}
variable "avail_zone_b" {}
variable "env_prefix" {}
#
variable "username" {
  description = "The username for the DB master user"
  type        = string
}
variable "password" {
  description = "The password for the DB master user"
  type        = string
}