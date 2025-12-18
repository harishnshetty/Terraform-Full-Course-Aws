resource "aws_instance" "instance1" {
  ami           = data.aws_ami.ubuntu_2404.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("user_data.sh")
  tags          = var.tags

  lifecycle {
    prevent_destroy = false
  }

}

resource "aws_security_group" "default" {
  name        = "default_SG"
  description = "Default security group"
  vpc_id      = data.aws_vpc.default.id

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
