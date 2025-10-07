output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = module.rds_instance.rds_endpoint
}

output "rds_username" {
  description = "Usuário administrador do RDS"
  value       = module.rds_instance.rds_username
}

output "rds_subnet_group" {
  description = "Nome do subnet group criado"
  value       = module.rds_instance.rds_subnet_group
}