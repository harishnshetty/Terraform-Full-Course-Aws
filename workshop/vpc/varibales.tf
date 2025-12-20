variable "region" {
  type        = string
  description = "The region in which to create the VPC."
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "public_subnet" {
  type        = list(string)
  description = "The CIDR block for the public subnets."
}

variable "private_subnet" {
  type        = list(string)
  description = "The CIDR block for the private subnets."
}

variable "azs" {
  type        = list(string)
  description = "The availability zones for the VPC."
}


variable "ami_id" {
  type        = string
  description = "The AMI ID for the instance."
}

variable "instance_type" {
  type        = string
  description = "The instance type for the instance."
}

variable "key_name" {
  type        = string
  description = "The key name for the instance."
}
