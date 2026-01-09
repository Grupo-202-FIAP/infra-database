module "rds_instance" {
  source                   = "./modules/rds"
  rds_identifier_name      = var.rds_identifier_name
  rds_sg_ids               = [data.terraform_remote_state.network.outputs.security_group_postgres_id]
  db_subnet_group_name     = var.subnet_group_name
  private_subnet_ids       = data.terraform_remote_state.network.outputs.private_subnet_ids
  rds_username_secret_name = var.rds_username_ssm_path
  rds_password_secret_name = var.rds_password_ssm_path

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  engine            = var.engine
  engine_version    = var.engine_version
  
  ec2_security_group_id = data.terraform_remote_state.network.outputs.security_group_api_id
}

module "ec2_bastion" {
  source = "./modules/ec2_bastion"
  
  bastion_instance_type    = var.bastion_instance_type
  bastion_instance_name    = var.bastion_instance_name
  bastion_ami              = var.bastion_ami
  bastion_key_name         = var.bastion_key_name
  bastion_key_secret_name  = var.bastion_key_secret_name
  bastion_root_volume_size = var.bastion_root_volume_size
  
  public_subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  bastion_sg_id    = data.terraform_remote_state.network.outputs.sg_bastion_id
}