terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.1"
    }
  }
  backend "s3" {
    bucket = "lucas-gonella-remote-state"
    key    = "aws-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "lucas-gonella-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
