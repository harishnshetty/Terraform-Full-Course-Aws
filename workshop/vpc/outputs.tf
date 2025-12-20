output "public_subnet_ids" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip

}

output "nginx_instance_public_ip" {
  value = aws_instance.nginx_server.public_ip

}
