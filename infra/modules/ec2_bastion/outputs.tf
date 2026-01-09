output "bastion_instance_id" {
  description = "Instance ID of the Bastion"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Public IP address of the Bastion"
  value       = aws_instance.bastion.public_ip
}

output "bastion_private_ip" {
  description = "Private IP address of the Bastion"
  value       = aws_instance.bastion.private_ip
}

output "bastion_security_group_id" {
  description = "Security Group ID of the Bastion"
  value       = var.bastion_sg_id
}

output "bastion_key_pair_name" {
  description = "Name of the Key Pair"
  value       = aws_key_pair.bastion.key_name
}

output "bastion_private_key_secret_arn" {
  description = "ARN of the secret containing the private key"
  value       = aws_secretsmanager_secret.bastion_private_key.arn
}

output "bastion_private_key_secret_name" {
  description = "Name of the secret containing the private key"
  value       = aws_secretsmanager_secret.bastion_private_key.name
}
