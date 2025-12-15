#VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az

  map_public_ip_on_lanch = true

  tag = {
    Name = "${var.project_name}-public-subnet"
  }
}

#Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tag = {
    Name = "${var.project_name}-public-rt"
  }
}

#Route: Internet → Public Subnet
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

#Route Table Association
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}