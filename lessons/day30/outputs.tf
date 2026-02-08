output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "load_balancer_dns" {
  value = aws_lb.app_lb.dns_name
}

output "load_balancer_arn" {
  value = aws_lb.app_lb.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.app_asg.name
}

output "nat_gateway_ips" {
  value = aws_eip.main[*].public_ip
}
