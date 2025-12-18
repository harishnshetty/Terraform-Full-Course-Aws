resource "aws_instance" "instance1" {
  ami                    = data.aws_ami.ubuntu_2404.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file("user_data.sh")
  subnet_id              = data.aws_subnet.subneta.id
  security_groups        = [aws_security_group.default.id]
  vpc_security_group_ids = [aws_security_group.default.id]

  root_block_device {
    encrypted             = false
    volume_size           = 10
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip}"

  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt update",
  #     "sudo apt install nginx -y",
  #     "sudo systemctl start nginx",
  #     "sudo systemctl enable nginx",
  #     "echo '<html><body><h1>Hello World</h1></body></html>' | sudo tee /var/www/html/index.html"
  #   ]

  # }

  provisioner "file" {
    source      = "www/*"
    destination = "/var/www/html/*"
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
