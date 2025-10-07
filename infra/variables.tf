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