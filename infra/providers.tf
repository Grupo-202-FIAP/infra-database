terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "nextime-food-state-bucket"
    key     = "infra-database/infra.tfstate"
    region  = "us-east-1"
    encrypt = true
  }

}

provider "aws" {
  region = "us-east-1"
}

