terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  cloud {
    organization = "harish-cloud"
    workspaces {
      name = "cli-demo"
    }
  }
}
