
# VPC Module
module "tf-connect-vpc" {
  source             = "./modules/vpc-baseline"
  cidr_vpc           = var.cidr_vpc
  secondcidr_vpc     = var.secondcidr_vpc
  vpc_name           = var.vpc_name
  public_subnet_name = var.public_subnet_name
  private_subnet_name =var.private_subnet_name
  internet_gateway   = var.internet_gateway
  public_route       = var.public_route
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  nat-gateway        = var.nat-gateway
  private_route      = var.private_route
}


