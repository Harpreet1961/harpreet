
# VPC Module
module "tf-connect-vpc" {
  source             = "./modules/vpc-baseline"
  cidr_vpc           = var.cidr_vpc
  vpc_name           = var.vpc_name
  public_subnet_name = var.public_subnet_name
  internet_gateway   = var.internet_gateway
  public_route       = var.public_route
  public_subnets     = var.public_subnets
}


