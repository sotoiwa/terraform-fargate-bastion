variable "app_name" {}
variable "vpc_id" {}
variable "isolated_subnet_a_id" {}
variable "isolated_subnet_c_id" {}
variable "db_master_username" {}
variable "db_master_password" {}
variable "security_group_bastion_id" {}

data "aws_region" "this" {}
