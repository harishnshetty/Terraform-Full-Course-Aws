variable "region" {
  description = "region"
  type        = string
}


variable "primary_vpc_cidr" {
  description = "primary vpc cidr"
  type        = string
}


variable "vpc_tags" {
  description = "tags for vpc"
  type        = map(string)
}

variable "subnet_count" {
  description = "subnet count"
  type        = map(string)
  default = {
    public  = 3,
    private = 2
  }

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
