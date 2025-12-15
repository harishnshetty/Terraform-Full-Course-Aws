
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


terraform {

  backend "s3" {
  bucket = "my-tf-demo-harish-bucket-2025"
  key    = "day04/terraform.tfstate"
  region = "ap-south-1"
  encrypt = true
  use_lockfile = true

}


}


resource "aws_instance" "jenkins_server" {
  ami           = "ami-02b8269d5e85954ef" # Update with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Server"
  }
}