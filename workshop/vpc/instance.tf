resource "aws_instance" "jenkins_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  availability_zone           = var.azs[0]
  subnet_id                   = aws_subnet.public_subnet[0].id
  vpc_security_group_ids      = [aws_security_group.sg_group.id]
  user_data                   = file("user_data.sh")

  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_instance" "nginx_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  availability_zone           = var.azs[1]
  subnet_id                   = aws_subnet.public_subnet[1].id
  vpc_security_group_ids      = [aws_security_group.sg_group.id]
  user_data                   = file("nginx.sh")

  tags = {
    Name = "nginx-server"
  }
}

