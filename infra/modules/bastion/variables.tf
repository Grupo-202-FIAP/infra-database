variable "bastion_name" {
  type        = string
  description = "Nome da instância Bastion"
  default     = "bastion-host"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instância EC2 para o Bastion"
  default     = "t3.micro"
}

variable "public_subnet_id" {
  type        = string
  description = "ID da subnet pública onde o Bastion será criado"
}

variable "security_group_id" {
  type        = string
  description = "ID do security group do Bastion"
}

variable "key_name" {
  type        = string
  description = "Nome da key pair para acesso SSH ao Bastion"
}

variable "tags" {
  type        = map(string)
  description = "Tags a aplicar aos recursos"
  default     = {}
}
