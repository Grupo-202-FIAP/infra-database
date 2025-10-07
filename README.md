# infra-database

Este repositório é dedicado exclusivamente ao provisionamento do banco de dados (RDS) na AWS.

Todos os recursos de rede, subnets, security groups e demais dependências são criados por outro repositório de infraestrutura. Aqui, apenas o banco de dados é criado, utilizando os dados necessários via `terraform_remote_state`.

## Estrutura
- Módulo RDS para criação do banco
- Data source para buscar dependências externas
- Outputs apenas do banco

## Como usar
1. Certifique-se que o repositório de infraestrutura principal já está provisionado e o state está acessível.
2. Ajuste as variáveis do banco conforme necessário em `terraform.tfvars`.
3. Execute `terraform init`, `terraform plan` e `terraform apply` normalmente.

## Dependências
- Terraform >= 1.0
- AWS Provider

## Observação
Este projeto não cria recursos de rede, apenas o banco de dados.
