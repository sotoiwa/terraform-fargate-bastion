resource "aws_rds_cluster" "this" {
  cluster_identifier              = var.app_name
  engine                          = "aurora-postgresql"
  engine_mode                     = "provisioned"
  availability_zones              = ["${data.aws_region.this.name}a", "${data.aws_region.this.name}c"]
  master_username                 = var.db_master_username
  master_password                 = var.db_master_password
  port                            = 5432
  vpc_security_group_ids          = [aws_security_group.this.id]
  db_subnet_group_name            = aws_db_subnet_group.this.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.name
  backup_retention_period         = 7
  storage_encrypted               = true
  copy_tags_to_snapshot           = true

  deletion_protection = true
  skip_final_snapshot = true
  apply_immediately   = true

  serverlessv2_scaling_configuration {
    max_capacity = 1.0
    min_capacity = 0.5
  }

  lifecycle {
    ignore_changes = [master_password, availability_zones]
  }
}

resource "aws_rds_cluster_parameter_group" "this" {
  name   = "${var.app_name}-pg"
  family = "aurora-postgresql13"
}

resource "aws_rds_cluster_instance" "az_a_1" {
  identifier                   = "${var.app_name}-instance-a-1"
  cluster_identifier           = aws_rds_cluster.this.id
  instance_class               = "db.serverless"
  engine                       = aws_rds_cluster.this.engine
  engine_version               = aws_rds_cluster.this.engine_version
  monitoring_role_arn          = aws_iam_role.this.arn
  monitoring_interval          = 60
  performance_insights_enabled = true
  availability_zone            = "${data.aws_region.this.name}a"
  apply_immediately            = true
}

resource "aws_rds_cluster_instance" "az_c_1" {
  identifier                   = "${var.app_name}-instance-c-1"
  cluster_identifier           = aws_rds_cluster.this.id
  instance_class               = "db.serverless"
  engine                       = aws_rds_cluster.this.engine
  engine_version               = aws_rds_cluster.this.engine_version
  monitoring_role_arn          = aws_iam_role.this.arn
  monitoring_interval          = 60
  performance_insights_enabled = true
  availability_zone            = "${data.aws_region.this.name}a"
  apply_immediately            = true
}
