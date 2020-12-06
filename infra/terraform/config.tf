terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "astoria-terraform-state"
    key    = "state.json"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = "ap-southeast-2"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}
