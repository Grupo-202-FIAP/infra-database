variable "bastion_instance_type" {
  description = "Instance type for Bastion EC2 (ex: t3.micro, t3.small)"
  type        = string
}

variable "bastion_instance_name" {
  description = "Name for the Bastion EC2 instance"
  type        = string
}

variable "bastion_ami" {
  description = "AMI ID for Bastion (Amazon Linux 2 or Ubuntu 22.04)"
  type        = string
}

variable "bastion_key_name" {
  description = "Name for the Bastion Key Pair"
  type        = string
}

variable "bastion_key_secret_name" {
  description = "Name of the secret in AWS Secrets Manager for storing the private key"
  type        = string
}

variable "bastion_root_volume_size" {
  description = "Root volume size in GB for Bastion"
  type        = number
}

variable "public_subnet_id" {
  description = "Public subnet ID where Bastion will be deployed"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security Group ID for Bastion"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
