module "rds_instance" {
  source               = "./modules/rds"
  rds_identifier_name  = var.rds_identifier_name
  rds_sg_ids           = [data.terraform_remote_state.network.outputs.security_group_postgres_id]
  db_subnet_group_name = data.terraform_remote_state.network.outputs.private_subnet_group_name
  private_subnet_ids   = data.terraform_remote_state.network.outputs.private_subnet_ids
  rds_username_secret_name = var.rds_username_ssm_path
  rds_password_secret_name = var.rds_password_ssm_path
  rds_username        = var.rds_username
  rds_password        = var.rds_password
  tags                = var.tags
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  engine            = var.engine
  engine_version    = var.engine_version
}