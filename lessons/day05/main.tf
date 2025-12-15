resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name        = "${var.environment}-demo-vpc"
    environment = "${local.perprod_env}-${var.environment}"
  }
  
}


resource "aws_instance" "jenkins_server" {
    ami           = var.ami_id # Update with a valid AMI ID for your region
  instance_type = var.type

  tags = {
    Name = "${local.perprod_env}-${var.environment}-Jenkins-Server"
  }
  
}