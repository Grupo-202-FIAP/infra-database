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

# EC2 Bastion
ec2_key_pair_name           = "bastion-rds-key"
ec2_public_key              = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmJAqt+dX11W6ZwJ2G1eWwWz9+4QHbSp1X68emfHMQ3Ip+CmnqLAt9aOuyyxmKyJPxFuak2aObyv/Pe1It6e4LBIvj+JliW24ntyyGBBFEZ9FMhK0sZHBgh6Mg6aipCDIJkDdKqNQJ7BVFEfxOuPx9HRw0Wdw8dPHyOgbtJAmafIM72+j/05/BX450WKd1L3XD9d7ZJjoLu7HUFQYKzLtjp/FJe+nUWRpZTKQkNKlNbgCtLpnq+kOxcsA9k4lkZcjpx67HYaqlmVLwUn/kcvv3XQXCZC6U8nDl4U7fTrPXa6keu52CqA4tFFoR/a1/ExGOBef9pXi8fwlE8fHJVguudRLQQ5zWMd6ChlE4+uPC67z68BJ6dVf9goOcQGyusrx+FUFCbeQzy0yo2RjZOUHdBVjPmmMmn+5iGLqIuNyV51D75eJe+iFR+OYqhK4bwBsdeNRw/urkhsFVgPmgpP5JdpAkGtyJGqIrYnnnoZwymgOpjRQ3kYoUbIJaiGzrIKwa2EeWlf5AucO1To+T64cb5221gmeJ9ncQ1cdKSzCgAb1aL+zl6FydYxw/0Zlkonf+oCleWk4dKn/lq2xSNBSipcaLRGMA2/eE41d3ySVe5haSOp/ipPlsJ9tq5YVJ+zdLrDnyg70ydSjlYtb4s17akGKkcZ6w9qGoFYUmBbmFMw== bastion-rds"
ec2_security_group_name     = "ec2-bastion-rds-sg"
ec2_ssh_cidr_blocks         = ["0.0.0.0/0"] # Recomendado: restringir para seu IP
ec2_instance_type           = "t3.micro"
ec2_instance_name           = "bastion-rds-management"
ec2_associate_public_ip     = true