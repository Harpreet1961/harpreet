
# # VPC Module
# module "tfc-connect-vpc" {
#   source             = "./modules/vpc-baseline"
#   cidr_vpc           = var.cidr_vpc
#   secondcidr_vpc     = var.secondcidr_vpc
#   vpc_name           = var.vpc_name
#   instance-tenancy   =  var.instance-tenancy
#   enable-dns-support =  var.enable-dns-support
#   enable-dns-hostnames=  var.enable-dns-hostnames  
#   #public_subnet_name = var.public_subnet_name
#   vpc-private-subnet-cidr =var.vpc-private-subnet-cidr
#   vpc-infra-subnet-cidr = var.vpc-infra-subnet-cidr
#   #internet_gateway   = var.internet_gateway
#   private_subnet_name = var.private_subnet_name
#   #public_route       = var.public_route
#   #public_subnets     = var.public_subnets
#   #private_subnets    = var.private_subnets
#   #nat-gateway        = var.nat-gateway
#   #private_route      = var.private_route
#   #cidr_infra          = var.cidr_infra
#   infra-subnets       =var.infra-subnets
#   #vpc_id            = module.tf-coonect-vpc.vpc_id

# }

# VPC Module
module "tfc-connect-vpc" {
  source             = "./modules/vpc-baseline"
  tfc_vpc_object     = var.tfc_vpc_object
  tfc_subnet_object  = var.tfc_subnet_object
  flow-log           = var.flow-log
  cloudwatch-logs-name = var.cloudwatch-logs-name
  flow-log-role-name   = var.flow-log-role-name
 
  # cidr_vpc           = var.cidr_vpc
  # secondcidr_vpc     = var.secondcidr_vpc
  # vpc_name           = var.vpc_name
  # instance-tenancy   =  var.instance-tenancy
  # enable-dns-support =  var.enable-dns-support
  # enable-dns-hostnames=  var.enable-dns-hostnames  
  # vpc-private-subnet-cidr =var.vpc-private-subnet-cidr
  # vpc-infra-subnet-cidr = var.vpc-infra-subnet-cidr
  #  private_subnet_name = var.private_subnet_name
  #  infra-subnets       =var.infra-subnets
  

}

data "aws_vpc" "vpc_id" {
depends_on = [
  module.tfc-connect-vpc
]


  filter {
    name   = "tag:Name"
    values = ["*test*","*test1*"]
  }
}

module "tf-connect-tgw" {
  source = "./modules/tgw_subnets"
  tfc_tgw_object = var.tfc_tgw_object
  depends_on = [
    data.aws_vpc.vpc_id
  ]
  vpc_id = data.aws_vpc.vpc_id.id
  tgw-attachment-name = var.tgw-attachment-name
  transit_gateway_id = "tgw-01ac968eda377c2fd"
}



module "tf-connect-sg" {
  source = "./modules/security_group"
  cidr_tgw = "10.0.0.0/8"
  vpc_id = data.aws_vpc.vpc_id.id
  #cidr_vpc = var.cidr_vpc
  cidr_vpc = data.aws_vpc.vpc_id.cidr_block
  sg_name = var.sg_name
}

# VPC-Flow-Logs destined to CLoudwatch Logs

# resource "aws_flow_log" "vpc-flow-logs" {
#   iam_role_arn    = "${aws_iam_role.vpc-flow-logs-role.arn}"
#   log_destination = "${aws_cloudwatch_log_group.cloudwatch-log-groups.arn}"
#   traffic_type    = "ALL"
#   vpc_id          = data.aws_vpc.vpc_id.id
#   tags = {
#     "Name" = "test-vpc-flow-logs"
#   }
# }

# resource "aws_cloudwatch_log_group" "cloudwatch-log-groups" {
#   name = "example"
# }

# resource "aws_iam_role" "vpc-flow-logs-role" {
#   name = "example"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "",
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "vpc-flow-logs.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_role_policy" "vpc-flow-logs-policy" {
#   name = "example"
#   role = aws_iam_role.vpc-flow-logs-role.id

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": [
#         "logs:CreateLogGroup",
#         "logs:CreateLogStream",
#         "logs:PutLogEvents",
#         "logs:DescribeLogGroups",
#         "logs:DescribeLogStreams"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }





/*module "vpc" {
  source = "C:\\Users\\Harpreet.Singh1\\Documents\\terraform_code\\modules\\vpc"

  
  vpc-cidr                            = "10.11.0.0/16"
  vpc-public-subnet-cidr              = ["10.11.1.0/24","10.11.2.0/24"]
  vpc-private-subnet-cidr             = ["10.11.4.0/24","10.11.5.0/24"]
  vpc-database_subnets-cidr           = ["10.11.7.0/24", "10.11.8.0/24"]

}*/

/*data "aws_route_tables" "rts" {
  vpc_id = "${module.tf-connect-vpc.vpc_id}"
  filter {
    name   = "tag:Name"
    values = ["*private*","*infra*"]
  }
}*/

/*module "tf-connect-tgwsub" {
  source = "./modules/TGW_Subnets"
  vpc_id = "${module.tf-connect-vpc.vpc_id}"
  #tg-cidr = var.tg-cidr
  transit-name = var.transit-name
  transit-routes = var.transit-routes
  transit_gateway_id =var.transit_gateway_id
  transit_subnets = var.transit_subnets
  route_tables = data.aws_route_tables.rts.ids
}*/












