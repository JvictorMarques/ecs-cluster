terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.62.0"
    }
  }
}

provider "aws" {
  profile = "jvictor_sandbox"
  region  = "us-east-1"
  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "ecs-cluster"
    }
  }
}