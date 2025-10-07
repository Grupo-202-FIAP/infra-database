output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.rds.endpoint
}

output "rds_username" {
  description = "Usuário administrador do RDS"
  value       = aws_ssm_parameter.rds_username.value
}

