variable "environment" {
    type = string
  
}

variable "allowed_region" {
    type = set(string)
  
}

variable "availability_zone" {
    type = set(string)
      
}

variable "instance_count" {
    type = number
  
}

variable "ami_id" {
    type = string
  
}
variable "instance_type" {
    type = string
  
}

variable "monitoring_enabled" {
    type = bool
  
}

variable "associated_public_ip_address" {
    type = bool
  
}

variable "tags" {
    type = map(string)
  
}

variable "cidr_block" {
description = "cidr block for the vpc"
  type = list(string)
}

variable "ingress_1" {
    type = tuple([ number, string, number ])
     
}

variable "key_name" {
    type = string
  
}