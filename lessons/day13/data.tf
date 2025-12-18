data "aws_ami" "ubuntu_2404" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}


data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["Default_VPC"]
  }
}

data "aws_subnet" "subneta" {
  filter {
    name   = "tag:Name"
    values = ["Default ap-south-1a"]
  }
}

data "aws_security_group" "default" {
  filter {
    name   = "tag:Name"
    values = ["Default_SG"]
  }
}