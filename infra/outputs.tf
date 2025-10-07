output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = module.rds_instance.rds_endpoint
}