terraform {
  backend "s3" {
    bucket         = backend-tf-shotorouu
    key            = "tf-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = table-tf-shotorouu
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.64.0"
    }
  }
}

provider "aws" {
}
