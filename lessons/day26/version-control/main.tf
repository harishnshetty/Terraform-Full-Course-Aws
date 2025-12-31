
#Create VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "My_demo_vpc"
  }
}

#Create S3 Bucket
resource "aws_s3_bucket" "first_demo_bucket" {
  bucket = "s3-bucket-${aws_vpc.demo_vpc.id}"

  tags = {
    Name        = "My bucket 1.0"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "second_demo_bucket" {
  bucket = "s3-bucket-${aws_vpc.demo_vpc.id}"

  tags = {
    Name        = "My bucket 1.0"
    Environment = "Dev"
  }
}
