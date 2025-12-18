
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "tags" {
  type = map(string)
}

variable "private_key_path" {
  type = string
}
