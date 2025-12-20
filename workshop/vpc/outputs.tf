output "region" {
  value = var.region
}

output "primary_vpc_cidr" {
  value = var.primary_vpc_cidr
}

output "vpc_tags" {
  value = var.vpc_tags
}

output "subnet_count" {
  value = var.subnet_count
}

output "public_subnet_cidr" {
  value = var.public_subnet_cidr
}

output "private_subnet_cidr" {
  value = var.private_subnet_cidr
}

output "availability_zone" {
  value = var.availability_zone
}

output "primary_vpc_id" {
  value = aws_vpc.primary_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_id" {
  value = aws_nat_gateway.nat.id
}

output "eip_id" {
  value = aws_eip.nat.id
}




