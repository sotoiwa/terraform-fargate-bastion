output "security_group_bastion_id" {
  value = aws_security_group.this.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.this.arn
}

output "iam_role_ssm_service_name" {
  value = aws_iam_role.ssm_service.name
}
