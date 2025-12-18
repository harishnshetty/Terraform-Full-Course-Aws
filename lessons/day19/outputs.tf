output "instance_id" {
  value = aws_instance.instance1.id
}

output "instance_public_ip" {
  value = aws_instance.instance1.public_ip
}

output "instance_private_ip" {
  value = aws_instance.instance1.private_ip
}
output "ami_id" {
  value = data.aws_ami.ubuntu_2404.id
}