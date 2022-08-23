output "private_subnet_a_id" {
  value = module.network.private_subnet_a_id
}

output "private_subnet_c_id" {
  value = module.network.private_subnet_c_id
}

output "instance_bastion_id" {
  value = module.bastion.instance_bastion_id
}

output "security_group_bastion_id" {
  value = module.bastion.security_group_bastion_id
}

output "ecs_cluster_name" {
  value = module.bastion.ecs_cluster_name
}

output "ecs_task_definition_arn" {
  value = module.bastion.ecs_task_definition_arn
}

output "iam_role_ssm_service_name" {
  value = module.bastion.iam_role_ssm_service_name
}

output "rds_cluster_endpoint" {
  value = module.database.rds_cluster_endpoint
}
