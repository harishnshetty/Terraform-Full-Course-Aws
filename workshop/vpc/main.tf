resource "aws_vpc" "main_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_subnet[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-igw"
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "public-rt"
  }

}

resource "aws_route" "public_rt_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_igw.id

}

resource "aws_route_table_association" "public_rt_assoc" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "private-rt"
  }

}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_nat_gateway" "main_nat" {
  allocation_id = aws_eip.main_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "main-nat"
  }
}

resource "aws_eip" "main_eip" {
  domain = "vpc"
  tags = {
    Name = "main-eip"
  }
}

resource "aws_route" "nat-gw_rt" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main_nat.id

  depends_on = [aws_eip.main_eip]

}

