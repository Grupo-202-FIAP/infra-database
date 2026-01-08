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

# EC2 Bastion Outputs
output "ec2_bastion_instance_id" {
  description = "ID da instância EC2 bastion"
  value       = module.ec2_bastion.instance_id
}

output "ec2_bastion_public_ip" {
  description = "IP público da instância EC2 bastion"
  value       = module.ec2_bastion.instance_public_ip
}

output "ec2_bastion_private_ip" {
  description = "IP privado da instância EC2 bastion"
  value       = module.ec2_bastion.instance_private_ip
}

output "ec2_bastion_key_pair_name" {
  description = "Nome da chave SSH para a EC2 bastion"
  value       = module.ec2_bastion.key_pair_name
}

output "ec2_bastion_ssh_command" {
  description = "Comando para conectar via SSH à EC2 bastion"
  value       = "ssh -i /path/to/private/key.pem ec2-user@${module.ec2_bastion.instance_public_ip}"
}