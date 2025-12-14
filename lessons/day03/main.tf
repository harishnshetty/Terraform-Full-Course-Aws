terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}


# Create a S3 bucket
resource "aws_s3_bucket" "tf_demo_harish_bucket" {
  bucket = "my-tf-demo-harish-bucket-2025"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}