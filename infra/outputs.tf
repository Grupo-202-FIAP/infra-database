output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = module.rds_instance.rds_endpoint
}

output "rds_username" {
  description = "Usuário do RDS"
  value       = module.rds_instance.rds_username
}

output "rds_password_ssm_param" {
  description = "Caminho do SSM Parameter Store com a senha do RDS"
  value       = var.rds_password_ssm_path
}