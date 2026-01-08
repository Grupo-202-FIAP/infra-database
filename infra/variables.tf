variable "subnet_group_name" {
  description = "Nome do DB Subnet Group usado para o RDS. Deve ser igual ao criado no repositório de rede."
  type        = string
}
variable "rds_username_ssm_path" {
  description = "Caminho (name) no SSM Parameter Store para o nome de usuário do RDS."
  type        = string
}

variable "rds_password_ssm_path" {
  description = "Caminho (name) no SSM Parameter Store para a senha do RDS."
  type        = string
}

variable "instance_class" {
  description = "Classe da instância RDS (ex: db.t3.micro, db.m6g.large)."
  type        = string
}

variable "allocated_storage" {
  description = "Tamanho inicial do armazenamento alocado para a instância RDS em GB."
  type        = number
}

variable "engine" {
  description = "Engine do banco de dados (ex: postgres, mysql, oracle-se2)."
  type        = string
}

variable "engine_version" {
  description = "Versão principal do Engine do banco de dados (ex: 15, 14.7)."
  type        = string
}

variable "api_gw_name" {
  description = "Nome da API REST no API Gateway."
  type        = string
}

variable "api_gw_description" {
  description = "Descrição da API REST no API Gateway."
  type        = string
}

variable "api_gw_root_path" {
  description = "Nome do recurso raiz (root resource) para a API (ex: items, products)."
  type        = string
}

variable "api_stage_name" {
  description = "Nome do stage de deploy da API (ex: dev, hom, prod)."
  type        = string
}

variable "rds_identifier_name" {
  description = "Identificador único da instância RDS (o nome da instância na AWS)."
  type        = string
}

variable "bucket_name" {
  description = "Nome do bucket"
  type        = string
}

# EC2 Bastion Variables
variable "ec2_key_pair_name" {
  description = "Nome da chave SSH para a EC2 bastion"
  type        = string
}

variable "ec2_public_key" {
  description = "Chave pública SSH para a EC2 bastion (conteúdo completo da chave .pub)"
  type        = string
  sensitive   = true
}

variable "ec2_security_group_name" {
  description = "Nome do security group da EC2 bastion"
  type        = string
  default     = "ec2-bastion-rds-sg"
}

variable "ec2_ssh_cidr_blocks" {
  description = "CIDR blocks permitidos para SSH à EC2 bastion (ex: [\"203.0.113.0/24\"])"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ec2_instance_type" {
  description = "Tipo da instância EC2 bastion (ex: t3.micro, t3.small)"
  type        = string
  default     = "t3.micro"
}

variable "ec2_instance_name" {
  description = "Nome da instância EC2 bastion"
  type        = string
  default     = "bastion-rds-management"
}

variable "ec2_associate_public_ip" {
  description = "Se a EC2 bastion deve ter IP público"
  type        = bool
  default     = true
}