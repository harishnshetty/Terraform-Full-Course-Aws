# data "aws_vpc" "primary" {
#   id = aws_vpc.primary_vpc.id

# }

# data "aws_subnet" "public_subnet" {
#   for_each = var.public_subnet_cidr
#   id       = aws_subnet.public[each.key].id
# }

# data "aws_subnet" "private_subnet" {
#   for_each = var.private_subnet_cidr
#   id       = aws_subnet.private_subnet_cidr[each.key].id
# }

# output "vpc_id" {
#   value = data.aws_vpc.primary.id
# }

# output "public_subnet_ids" {
#   value = [for subnet in data.aws_subnet.public_subnet : subnet.id]
# }

# output "private_subnet_ids" {
#   value = [for subnet in data.aws_subnet.private_subnet : subnet.id]
# }
