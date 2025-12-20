output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}
output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private_subnet[*].id
}

output "main_vpc_id" {
  description = "Main VPC ID"
  value       = aws_vpc.main_vpc.id
}

output "jenkins_SG_id" {
  description = "Security group ID from VPC module"
  value       = aws_security_group.jenkins_SG.id
}
