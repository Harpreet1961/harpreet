# Creating VPC.
resource "aws_vpc" "demo-vpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name
  }
}

# Creating Public Subnet.
resource "aws_subnet" "demo-public-subnet" {

  vpc_id     = aws_vpc.demo-vpc.id
  cidr_block = var.public_subnets
  tags = {
    Name = var.public_subnet_name
  }
}

# Creating Internet Gateway.
resource "aws_internet_gateway" "demo_igw" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = var.internet_gateway
  }
}


# Creating route table.
resource "aws_route_table" "demo-PubRoute" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = var.public_route
  }
}


