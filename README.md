# infra-database

[Documentação do Projeto FastFood - Banco de Dados (PDF)](/doc/Projeto%20FastFood%20-%20Banco%20de%20Dados.pdf)

Este repositório provisiona exclusivamente a camada de banco de dados (RDS PostgreSQL) para o projeto FastFood na AWS.

## 📋 Visão Geral

Este repositório faz parte de uma arquitetura modular, sendo responsável apenas pelo provisionamento do banco de dados RDS. Todos os recursos de rede (VPC, subnets, security groups) são gerenciados por outro repositório (`infra-core`) e consumidos aqui via **Terraform Remote State**.

## 🏗️ Arquitetura

### Recursos Provisionados
- **RDS PostgreSQL 15** (instância db.t3.micro com 50GB)
- **Credenciais Seguras** gerenciadas via AWS SSM Parameter Store
- **Senha Aleatória** gerada automaticamente com requisitos de complexidade
- **Integração com Infraestrutura Existente** via remote state

### Componentes
```
infra/
├── main.tf              # Invocação do módulo RDS
├── data.tf              # Remote state da infraestrutura de rede
├── providers.tf         # Configuração do provider AWS e backend S3
├── variables.tf         # Declaração de variáveis
├── terraform.tfvars     # Valores das variáveis
├── outputs.tf           # Outputs do endpoint e credenciais
└── modules/
    └── rds/
        ├── main.tf      # Recursos: RDS, SSM Parameters, random password
        ├── variables.tf # Variáveis do módulo
        └── outputs.tf   # Outputs do módulo
```

## 🔒 Segurança

- **Credenciais**: Usuário e senha armazenados no SSM Parameter Store
- **Senha**: Gerada automaticamente com 16 caracteres (minúsculas, maiúsculas, números e caracteres especiais)
- **Security Groups**: Importados da infraestrutura de rede via remote state
- **Backend S3**: State file armazenado de forma criptografada

## 📦 Dependências Externas

Este projeto consome via **Terraform Remote State** (`infra-core`):
- `security_group_postgres_id` - Security group para o RDS
- `private_subnet_ids` - Subnets privadas para o DB subnet group
- `security_group_api_id` - Security group da aplicação/API

**Backend S3**: `nextime-food-state-bucket/infra-core/infra.tfstate`

## ⚙️ Configuração

### Variáveis Principais (terraform.tfvars)
```hcl
# RDS
rds_identifier_name   = "db-fastfood1"
instance_class        = "db.t3.micro"
allocated_storage     = 50
engine                = "postgres"
engine_version        = "15"

# SSM Parameter Store
rds_username_ssm_path = "/fastfood/rds/username"
rds_password_ssm_path = "/fastfood/rds/password"

# Subnet Group
subnet_group_name = "infra-subnet-private"
```

## 🚀 Como Usar

### Pré-requisitos
1. Repositório `infra-core` já provisionado e state acessível no S3
2. AWS CLI configurado com credenciais válidas
3. Terraform >= 1.0 instalado

### Provisionamento
```bash
cd infra/
terraform init
terraform plan
terraform apply
```

### Outputs Disponíveis
Após o `apply`, você terá acesso a:
- `rds_endpoint` - Endpoint de conexão do banco de dados
- `rds_username` - Usuário master (sensível)
- `rds_password_ssm_param` - Path do SSM com a senha (sensível)

## 📚 Documentação SQL

O diretório `/doc` contém:
- `01_schema_users.sql` - Schema das tabelas `customers` e `internal_users` com indexes otimizados
- PDF com documentação completa do projeto

### Tabelas Criadas
- **customers**: Clientes do sistema (integração com Cognito)
- **internal_users**: Usuários internos/administrativos

## 🛠️ Tecnologias

- **Terraform** 1.0+
- **AWS Provider** 6.14.1
- **Random Provider** 3.7.2
- **PostgreSQL** 15

## ⚠️ Observações Importantes

- Este repositório **NÃO cria recursos de rede** (VPC, subnets, etc.)
- O RDS está configurado como **publicly_accessible = true** (padrão do módulo)
- `skip_final_snapshot = true` - Não cria snapshot ao destruir (ambiente dev)
- A senha do RDS é armazenada como **SecureString** no SSM

## 🔗 Repositórios Relacionados

- **infra-core**: Infraestrutura de rede e recursos compartilhados
- **Backend/API**: Aplicação que consome este banco de dados
