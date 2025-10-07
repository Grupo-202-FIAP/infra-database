rds_identifier_name      = "db-fastfood"
rds_sg_id               = "sg-xxxxxxxx" # Substitua pelo ID do SG desejado
db_subnet_group_name    = "infra-subnet-private"
private_subnet_ids      = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"] # Substitua pelos IDs das subnets privadas

rds_username_ssm_path   = "/fastfood/rds/username"
rds_password_ssm_path   = "/fastfood/rds/password"
instance_class          = "db.t3.micro"
allocated_storage       = 50
engine                  = "postgres"
engine_version          = "15"

tags = {
  Owner = "fast-food-fiap"
}