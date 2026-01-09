# RDS
rds_identifier_name   = "db-fastfood1"
rds_username_ssm_path = "/fastfood/rds/username"
rds_password_ssm_path = "/fastfood/rds/password"
instance_class        = "db.t3.micro"
allocated_storage     = 50
engine                = "postgres"
engine_version        = "15"

# Nome do DB Subnet Group criado pelo repositório de rede
subnet_group_name = "infra-subnet-private"

# Gateway
api_gw_name        = "crud-api"
api_gw_description = "CRUD API Gateway"
api_gw_root_path   = "items"
api_stage_name     = "dev"

# S3
bucket_name = "terraform-state-bucket-nextime"

# Bastion EC2
bastion_instance_type    = "t3.micro"
bastion_instance_name    = "bastion-db-access"
bastion_key_name         = "bastion-key-prod"
bastion_key_secret_name  = "/fastfood/bastion/private-key"
bastion_root_volume_size = 20
# Amazon Linux 2 AMI in us-east-1 (update if using different region)
bastion_ami = "ami-0c02fb55731490381"