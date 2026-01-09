output "bastion_public_ip" {
  description = "IP público do Bastion Host"
  value       = aws_eip.bastion.public_ip
}

output "bastion_instance_id" {
  description = "ID da instância Bastion"
  value       = aws_instance.bastion.id
}

output "bastion_private_ip" {
  description = "IP privado do Bastion Host"
  value       = aws_instance.bastion.private_ip
}
