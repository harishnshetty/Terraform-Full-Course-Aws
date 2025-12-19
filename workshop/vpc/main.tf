resource "aws_vpc" "primary_vpc" {
  cidr_block           = var.primary_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  region               = var.region
  tags                 = var.vpc_tags
}

resource "aws_subnet" "public_subnet" {
  for_each = toset(var.public_subnet_cidr)

  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zone, index(var.public_subnet_cidr, each.value))

  tags = {
    Name = "public-subnet-${each.key}"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.primary_vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = {
    Name = "nat"
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat"
  }
}


resource "aws_subnet" "private_subnet" {
  for_each = toset(var.private_subnet_cidr)

  vpc_id            = aws_vpc.primary_vpc.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zone, index(var.private_subnet_cidr, each.value))

  tags = {
    Name = "private-subnet-${each.key}"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.primary_vpc.id

  tags = {
    Name = "public"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.primary_vpc.id

  tags = {
    Name = "private"
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.private.id
}

