
resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block[2]
    region = tolist(var.allowed_region)[0]


  tags = {
    Name        = "${var.environment}-main-vpc"
    environment = var.environment
  }
  
}


resource "aws_security_group" "jenkins_sg" {
  name        = "${var.environment}-jenkins-sg"
  description = "Security group for Jenkins server"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "jenkins_server" {
  
  count = var.instance_count
  ami = var.ami_id
  key_name = var.key_name

  associate_public_ip_address = var.associated_public_ip_address
  instance_type = var.instance_type

    availability_zone = tolist(var.availability_zone)[0]
    security_groups = [aws_security_group.jenkins_sg.name]
  tags = var.tags
  depends_on = [ aws_vpc.main_vpc ]
}
