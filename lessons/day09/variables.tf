variable "bucket_names" {
    type = list(string)
  
}

variable "bucket_names_set" {
    type = set(string)
  
}



variable "environment" {
    type = string
  
}

variable "allowed_region" {
    type = set(string)
  
}

variable "availability_zone" {
    type = set(string)
      
}



variable "tags" {
    type = map(string)
  
}
