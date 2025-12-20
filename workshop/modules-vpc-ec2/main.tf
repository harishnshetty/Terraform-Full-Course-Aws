module "vpc" {
  source              = "./modules/vpc"
  cidr_block          = "10.75.0.0/16"
  public_subnet_cidr  = ["10.75.1.0/24", "10.75.2.0/24", "10.75.3.0/24"]
  private_subnet_cidr = ["10.75.4.0/24", "10.75.5.0/24", "10.75.6.0/24"]
  availability_zone   = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  tags = {
    Name = "vpc"
  }
}

module "ec2" {
  source                      = "./modules/ec2"
  ami_id                      = "ami-02b8269d5e85954ef"
  instance_type               = "t2.micro"
  key_name                    = "new-keypair"
  azs                         = ["ap-south-1a"]
  security_group_id           = module.vpc.jenkins_SG_id
  user_data                   = file("user_data.sh")
  subnet_id                   = module.vpc.public_subnet_ids[0]
  associate_public_ip_address = true
  availability_zone           = "ap-south-1a"
  tags = {
    Name = "ec2-instance"
  }
}
