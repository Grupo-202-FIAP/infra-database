variable "key_pair_name" {
  description = "Nome da chave SSH para acesso à EC2"
  type        = string
}

variable "public_key" {
  description = "Chave pública SSH (conteúdo completo da chave .pub)"
  type        = string
  sensitive   = true
}

variable "security_group_name" {
  description = "Nome do security group da EC2"
  type        = string
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks permitidos para SSH (ex: [\"203.0.113.0/24\"])"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  description = "Tipo da instância EC2 (ex: t3.micro, t3.small)"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet onde a EC2 será criada"
  type        = string
}

variable "vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "associate_public_ip" {
  description = "Se a EC2 deve ter IP público"
  type        = bool
  default     = true
}

variable "rds_endpoint" {
  description = "Endpoint do RDS (hostname)"
  type        = string
}

variable "rds_security_group_id" {
  description = "ID do Security Group do RDS para permitir acesso da EC2 Bastion"
  type        = string
  default     = ""
}
