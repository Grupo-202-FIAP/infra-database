output "rds_instance_id" {
  description = "ID da instância RDS criada"
  value       = module.rds_instance.rds_instance_id
}

output "rds_endpoint" {
  description = "Endpoint da instância RDS"
  value       = module.rds_instance.rds_endpoint
}