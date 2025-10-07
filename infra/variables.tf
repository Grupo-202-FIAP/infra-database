variable "rds_identifier_name" {
  description = "Identificador único da instância RDS (o nome da instância na AWS)."
  type        = string
}

variable "rds_sg_id" {
  description = "ID do Security Group para o RDS."
  type        = string
}

variable "db_subnet_group_name" {
  description = "Nome do grupo de subnets privadas para o RDS."
  type        = string
}

variable "private_subnet_ids" {
  description = "Lista de IDs das subnets privadas."
  type        = list(string)
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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags aplicadas aos recursos"
}