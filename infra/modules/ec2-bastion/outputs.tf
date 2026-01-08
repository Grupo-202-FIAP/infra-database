output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.ec2_bastion.id
}

output "instance_public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.ec2_bastion.public_ip
}

output "instance_private_ip" {
  description = "IP privado da instância EC2"
  value       = aws_instance.ec2_bastion.private_ip
}

output "security_group_id" {
  description = "ID do security group da EC2"
  value       = aws_security_group.ec2_sg.id
}

output "key_pair_name" {
  description = "Nome da chave SSH"
  value       = aws_key_pair.ec2_key.key_name
}
