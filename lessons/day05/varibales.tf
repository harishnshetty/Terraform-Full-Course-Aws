variable "environment" {
  description = "Tag Name environment"
  type = string
}

variable "region" {
    description = "AWS region to deploy resources"
    type = string
  
}

variable "cidr_block" {
    description = "CIDR block for the VPC"
    type = string
  
}

variable "ami_id" {
    description = "ubuntu ami id"
    type = string
  
}

variable "type" {
    description = "t2.micro instance type"
    type = string
  
}