variable "rds_identifier_name" {
  description = "Identificador do RDS"
  type        = string
}

variable "allocated_storage" {
  description = "Espaço em disco do RDS"
  type        = number
}

variable "instance_class" {
  description = "Tipo da instância do RDS"
  type        = string
}

variable "engine" {
  description = "Tipo de banco de dados"
  type        = string
}

variable "engine_version" {
  description = "Versão do banco"
  type        = string
}

variable "rds_username_secret_name" {
  description = "Nome do parâmetro SSM para o usuário"
  type        = string
}

variable "rds_password_secret_name" {
  description = "Nome do parâmetro SSM para a senha"
  type        = string
}

variable "rds_sg_ids" {
  description = "Lista de Security Groups para o RDS"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Lista de subnets privadas do RDS"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Nome do DB Subnet Group"
  type        = string
}

variable "publicly_accessible" {
  description = "Se o RDS deve ser publicamente acessível"
  type        = bool
  default     = true
}

variable "ec2_security_group_id" {
  description = "ID do Security Group do EC2 autorizado a conectar no RDS (opcional)"
  type        = string
  default     = ""
}

variable "db_port" {
  description = "Porta do banco de dados"
  type        = number
  default     = 5432
}
