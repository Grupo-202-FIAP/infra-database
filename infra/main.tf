module "rds_instance" {
  source               = "./modules/rds"
  rds_identifier_name  = var.rds_identifier_name
  rds_sg_ids           = [var.rds_sg_id]
  db_subnet_group_name = var.db_subnet_group_name
  private_subnet_ids   = var.private_subnet_ids

  rds_username_secret_name = var.rds_username_ssm_path
  rds_password_secret_name = var.rds_password_ssm_path

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  engine            = var.engine
  engine_version    = var.engine_version
  tags              = var.tags
}