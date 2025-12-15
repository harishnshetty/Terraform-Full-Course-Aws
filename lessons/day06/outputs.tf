output "vpc_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.demo_vpc.id
  
}


output "instance_id" {
    description = "The ID of the instance"
    value       = aws_instance.jenkins_server.id
  
}