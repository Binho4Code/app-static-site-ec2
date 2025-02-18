# PROVIDER
terraform {

  required_version = "~> 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.55"
    }
  }

}

backend "s3"  {

bucket = "terraform-state-do-kledson"
key = "terraform.tfstate"
region = "us east-1"
dynamodb_table = "terraform-state-lock-do-kledson"

}



provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./.aws/credentials"]
  profile                  = "fiap"
}
