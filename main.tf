
/*provider "aws" {
region = "us-east-1"
#access_key = "AKIARFPI7IB4G6O5SIU7"
#secret_key = "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"
#profile = "MYAWS"

}*/

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


