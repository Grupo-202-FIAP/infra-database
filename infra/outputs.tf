output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS (host:port)"
  value       = module.rds_instance.rds_endpoint
}

output "rds_address" {
  description = "Endereço (hostname) do RDS"
  value       = module.rds_instance.rds_address
}

output "rds_port" {
  description = "Porta do RDS"
  value       = module.rds_instance.rds_port
}

output "rds_database_name" {
  description = "Nome do banco de dados padrão do RDS"
  value       = module.rds_instance.rds_database_name
}

output "rds_username" {
  description = "Usuário do RDS"
  value       = module.rds_instance.rds_username
  sensitive   = true
}

output "rds_password_ssm_param" {
  description = "Caminho do SSM Parameter Store com a senha do RDS"
  value       = module.rds_instance.rds_password_ssm_parameter
  sensitive   = true
}

output "bastion_public_ip" {
  description = "IP público do Bastion Host"
  value       = module.bastion.bastion_public_ip
}

output "bastion_instance_id" {
  description = "ID da instância Bastion"
  value       = module.bastion.bastion_instance_id
}

output "bastion_private_ip" {
  description = "IP privado do Bastion Host"
  value       = module.bastion.bastion_private_ip
}
