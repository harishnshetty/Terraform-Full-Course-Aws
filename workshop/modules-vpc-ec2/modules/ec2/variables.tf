variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "user_data" {
  type = string
}


variable "subnet_id" {
  type = string
}

variable "associate_public_ip_address" {
  type = bool
}

variable "availability_zone" {
  type = string
}


variable "tags" {
  type = map(string)
}

variable "security_group_id" {
  type = string
}
