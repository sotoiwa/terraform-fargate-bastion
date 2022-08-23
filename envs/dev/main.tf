module "network" {
  source   = "../../modules/network"
  app_name = var.app_name
}

module "bastion" {
  source                                 = "../../modules/bastion"
  app_name                               = var.app_name
  vpc_id                                 = module.network.vpc_id
  private_subnet_a_id                    = module.network.private_subnet_a_id
  private_subnet_c_id                    = module.network.private_subnet_c_id
  session_manager_logging_log_group_name = var.session_manager_logging_log_group_name
  session_manager_logging_bucket_name    = var.session_manager_logging_bucket_name
}

module "database" {
  source                    = "../../modules/database"
  app_name                  = var.app_name
  vpc_id                    = module.network.vpc_id
  isolated_subnet_a_id      = module.network.isolated_subnet_a_id
  isolated_subnet_c_id      = module.network.isolated_subnet_c_id
  security_group_bastion_id = module.bastion.security_group_bastion_id
  db_master_username        = var.db_master_username
  db_master_password        = var.db_master_password
}
