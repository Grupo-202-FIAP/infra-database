# RDS
rds_identifier_name   = "db-fastfood"
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