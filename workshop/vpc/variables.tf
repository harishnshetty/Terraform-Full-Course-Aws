variable "primary_vpc_cidr" {
  description = "primary vpc cidr"
  type        = string

}
variable "region" {
  description = "region"
  type        = string
}

variable "vpc_tags" {
  description = "tags for vpc"
  type        = map(string)
}

variable "public_subnet_cidr" {
  description = "public subnet cidr"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "private subnet cidr"
  type        = list(string)
}


variable "availability_zone" {
  description = "availability zone"
  type        = list(string)
}
