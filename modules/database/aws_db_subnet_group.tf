resource "aws_db_subnet_group" "this" {
  name       = var.app_name
  subnet_ids = [var.isolated_subnet_a_id, var.isolated_subnet_c_id]
}
