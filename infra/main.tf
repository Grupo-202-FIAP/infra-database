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
  
  # Deixar vazio pois usaremos aws_security_group_rule no módulo EC2
  ec2_security_group_id = ""
}

module "ec2_bastion" {
  source = "./modules/ec2-bastion"

  key_pair_name           = var.ec2_key_pair_name
  public_key              = var.ec2_public_key
  security_group_name     = var.ec2_security_group_name
  ssh_cidr_blocks         = var.ec2_ssh_cidr_blocks
  instance_type           = var.ec2_instance_type
  instance_name           = var.ec2_instance_name
  subnet_id               = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
  vpc_id                  = data.terraform_remote_state.network.outputs.vpc_id
  associate_public_ip     = var.ec2_associate_public_ip
  rds_endpoint            = module.rds_instance.rds_endpoint
  
  # Passar o RDS Security Group para a regra de ingress
  rds_security_group_id   = data.terraform_remote_state.network.outputs.security_group_postgres_id
}