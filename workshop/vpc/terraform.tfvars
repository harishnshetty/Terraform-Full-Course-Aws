region         = "ap-south-1"
cidr_block     = "10.75.0.0/16"
public_subnet  = ["10.75.1.0/24", "10.75.2.0/24", "10.75.3.0/24"]
private_subnet = ["10.75.4.0/24", "10.75.5.0/24", "10.75.6.0/24"]
azs            = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
ami_id         = "ami-02b8269d5e85954ef"
instance_type  = "t2.micro"
key_name       = "new-keypair"
