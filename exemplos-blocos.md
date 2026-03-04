# Bloco terraform - Configurações do Terraform
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Bloco provider - Configuração do provedor AWS
provider "aws" {
  region = "us-east-1"
}

# Bloco resource - Recurso EC2
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "exemplo-instancia"
  }
}

# Bloco variable - Variável de entrada
variable "ambiente" {
  description = "Ambiente de deployment"
  type        = string
  default     = "desenvolvimento"
}

# Bloco output - Saída de valor
output "instancia_id" {
  description = "ID da instância EC2"
  value       = aws_instance.example.id
}

# Bloco locals - Valores locais
locals {
  projeto = "meu-projeto"
  tags_comuns = {
    Projeto = local.projeto
    Ambiente = var.ambiente
  }
}

# Bloco data - Fonte de dados
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# Bloco module - Módulo reutilizável
module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
  tags       = local.tags_comuns
}

# Bloco moved - Refatorar e mover recursos
moved {
  from = aws_instance.example
  to   = aws_instance.example_renamed
}

# Bloco import - Importar recurso existente
import {
  to = aws_instance.imported
  id = "i-0123456789abcdef0"
}

# Bloco check - Validar condições
check "instancia_running" {
  assert {
    condition     = aws_instance.example.instance_state == "running"
    error_message = "Instância EC2 não está em estado running."
  }
}

# Bloco removed - Remover recurso do estado
removed {
  from = aws_instance.old_instance

  lifecycle {
    destroy = false
  }
}