resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  user_data                   = var.user_data
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  availability_zone           = var.azs[0]
  tags = {
    Name = "ec2-instance"
  }
}
