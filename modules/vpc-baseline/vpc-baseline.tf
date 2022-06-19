# Creating VPC.
resource "aws_vpc" "demo-vpc" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name
  }
}

# Creating Secondary CIDR Blocks to VPC

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id = aws_vpc.demo-vpc.id
  cidr_block = var.secondcidr_vpc
  

}

# Creating Public Subnet.
resource "aws_subnet" "demo-public-subnet" {

  #vpc_id     = aws_vpc.demo-vpc.id
  vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = var.public_subnets
  map_public_ip_on_launch = var.enable
  tags = {
    Name = var.public_subnet_name
  }
}


# Creating Private Subnet
resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  cidr_block = var.private_subnets

  tags = {
    "Name" = var.private_subnet_name
  }


  
}

# Creating Internet Gateway.
resource "aws_internet_gateway" "demo_igw" {
  #vpc_id = aws_vpc.demo-vpc.id
  vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  tags = {
    Name = var.internet_gateway
  }
}


# Creating route table.
resource "aws_route_table" "demo-PubRoute" {
  #vpc_id = aws_vpc.demo-vpc.id
  vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_igw.id
  }
  tags = {
    Name = var.public_route
  }
}

# Creating Route Table for Private Subnets

resource "aws_route_table" "demo-pvtroute" {
  vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }
  tags = {
    Name = var.private_route
  }
  
  
}

#  Assigning Elastic ip

resource "aws_eip" "elastic_ip" {

  depends_on = [
    aws_internet_gateway.demo_igw
  ]
  
}

# Create NAT Gateway

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id = aws_subnet.demo-public-subnet.id
  tags = {
    Name = var.nat-gateway
  }

  
}

# Route Table Association

resource "aws_route_table_association" "pub_route_association" {
  subnet_id = aws_subnet.demo-public-subnet.id
  route_table_id = aws_route_table.demo-PubRoute.id
  
}

resource "aws_route_table_association" "pvt_route_association" {
  subnet_id = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.demo-pvtroute.id
  
}

