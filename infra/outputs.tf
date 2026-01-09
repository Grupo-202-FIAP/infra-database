output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = module.rds_instance.rds_endpoint
}

output "rds_username" {
  description = "Usuário do RDS"
  value       = module.rds_instance.rds_username
  sensitive   = true
}

output "rds_password_ssm_param" {
  description = "Caminho do SSM Parameter Store com a senha do RDS"
  value       = var.rds_password_ssm_path
  sensitive   = true
}

# Bastion outputs
output "bastion_instance_id" {
  description = "Instance ID of the Bastion"
  value       = module.ec2_bastion.bastion_instance_id
}

output "bastion_public_ip" {
  description = "Public IP address of the Bastion"
  value       = module.ec2_bastion.bastion_public_ip
}

output "bastion_private_ip" {
  description = "Private IP address of the Bastion"
  value       = module.ec2_bastion.bastion_private_ip
}

output "bastion_private_key_secret_name" {
  description = "Name of the secret in AWS Secrets Manager containing the private key"
  value       = module.ec2_bastion.bastion_private_key_secret_name
}

output "bastion_private_key_secret_arn" {
  description = "ARN of the secret in AWS Secrets Manager containing the private key"
  value       = module.ec2_bastion.bastion_private_key_secret_arn
}

output "bastion_key_pair_name" {
  description = "Name of the Key Pair for Bastion"
  value       = module.ec2_bastion.bastion_key_pair_name
}