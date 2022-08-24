variable "app_name" {}
variable "vpc_id" {}
variable "private_subnet_a_id" {}
variable "private_subnet_c_id" {}
variable "session_manager_logging_bucket_name" {}

data "aws_region" "this" {}
data "aws_caller_identity" "this" {}
