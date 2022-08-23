resource "aws_cloudwatch_log_group" "this" {
  name = var.app_name
}
