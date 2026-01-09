output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS (host:port)"
  value       = aws_db_instance.rds.endpoint
}

output "rds_address" {
  description = "Endereço (hostname) do RDS"
  value       = aws_db_instance.rds.address
}

output "rds_port" {
  description = "Porta do RDS"
  value       = aws_db_instance.rds.port
}

output "rds_database_name" {
  description = "Nome do banco de dados padrão do RDS"
  value       = aws_db_instance.rds.name
}

output "rds_username" {
  description = "Usuário administrador do RDS"
  value       = aws_ssm_parameter.rds_username.value
}

output "rds_password_ssm_parameter" {
  description = "Caminho do parâmetro SSM com a senha do RDS"
  value       = aws_ssm_parameter.rds_password.name
}
