# # Define Variables
# aws_region         = "us-east-1"
# #ccount_number     = ""
# cidr_vpc           = "10.11.0.0/16"
# secondcidr_vpc     = "172.0.0.0/16"
# #public_subnets     = "10.0.0.0/28"
# #private_subnets    =  "10.0.1.0/24"
# vpc-private-subnet-cidr =["10.11.4.0/24","10.11.5.0/24"]
# vpc-infra-subnet-cidr = ["10.11.7.0/24", "10.11.8.0/24"]
# vpc_name           = "demo-vpc"
# #public_subnet_name = "demo-public-subnet"
# private_subnet_name = "demo-private-subnet"
# #internet_gateway   = "demo-igw"
# #public_route       = "demo-PubRoute"
# #nat-gateway        = "demo-Nat"
# #private_route      = "demo-Pvtroute" 
# #cidr_infra         = "10.0.0.0/24"
# infra-subnets      = "Infra-Demo"
# #transit_subnets    = ["10.0.2.0/24","10.0.3.0/24"]
# #transit-name       = "demo_tgwsub"
# #transit-routes      = "demo-tgwroutetable"
# #transit_gateway_id = "tgw-0abf6b836f81eb889"
# #vpc_id             = module.tf-connect-vpc.vpc_id

tfc_vpc_object = {
  "vpc_object" = {
    cidr_vpc  = "10.142.53.0/24"
    instance-tenancy = "default"
    vpc_name = "test-vpc"
    enable-dns-support = true
    enable-dns-hostnames  = true
    secondcidr_vpc  = "172.0.0.0/16"
    # vpc-private-subnet-cidr = "10.11.4.0/24"
    # vpc-infra-subnet-cidr = "10.11.7.0/24"
    # private_subnet_name = "demo-private-subnet"
    # infra-subnets = "Infra-Demo"    
  }
}




tfc_subnet_object = {
  "primary_subnet_object" = {
    # secondcidr_vpc  = "172.0.0.0/16"
    vpc-private-subnet-cidr = "10.142.53.64/28"
    vpc-infra-subnet-cidr = "10.142.53.112/28"
    private_subnet_name = "demo-private-subnet1"
    availability_zone = "us-west-2a"
    infra-subnets = "Infra-Demo1"   
     pvt-route-name = "pvt-route-table1",
    infra-route-name = "infra-route-table1" 
  },
  "secondary_subnet_object" = {
    # secondcidr_vpc  = "172.0.0.0/16"
    vpc-private-subnet-cidr = "10.142.53.80/28"
    vpc-infra-subnet-cidr = "10.142.53.128/28"
    private_subnet_name = "demo-private-subnet3"
    availability_zone = "us-west-2b"
    infra-subnets = "Infra-Demo3"  
     pvt-route-name ="pvt-route-table3",
    infra-route-name ="infra-route-table3" 
  }
  
  
}

tfc_tgw_object = {
    "transit_subnets_object" ={
    #vpc_id  = string,
    transit-name = "tgw-subnet1"
    transit_subnets = "10.142.53.16/28"
    transit-routes = "transit-route-table1"
    availability_zone = "us-west-2b"
    #transit_gateway_id="tgw-01a5fc3e6e83e1b31"
   
  },
    "transit_sec_subnets_object" ={
    #vpc_id  = string,
    transit-name = "tgw-subnet2"
    transit_subnets = "10.142.53.32/28"
    transit-routes = "transit-route-table2"
    availability_zone = "us-west-2c"

}

}


#     tfc-bucket-object = {
#     "bucket_object" = {
#     bucket  = "sudha-tf-10-7-2022"
#     bucket_prefix = "test"
#     acl = "private"
#    # tags = "test-bucket"
#     force_destroy  = "false" 
#     acceleration_status  = "Suspended",
#     request_payer = "BucketOwner"
#     versioning = "Enabled"
#     environment_name = "Dev"
#     #policy = "null"
#     # vpc-private-subnet-cidr = "10.11.4.0/24"
#     # vpc-infra-subnet-cidr = "10.11.7.0/24"
#     # private_subnet_name = "demo-private-subnet"
#     # infra-subnets = "Infra-Demo"    
#   },

#   "bucket_devops_object" = {
#     bucket  = "sudha-devops-tf-10-7-2022"
#     bucket_prefix = "test2"
#     acl = "public-read"
#    # tags = "devops-bucket"
#     force_destroy  = "false" 
#     acceleration_status  = "Suspended",
#     request_payer = "BucketOwner"
#     versioning = "Suspended"
#     environment_name = "Test"
# }

#     }








tgw-attachment-name = "tgw-attachment"
sg_name = "sg-vpc"
flow-log = "test-vpc-flow-logs"
cloudwatch-logs-name = "test-cloudwatch-logs"
flow-log-role-name  =  "test-vpc-flow-log-role"

# cidr_vpc = "10.11.0.0/16"

service-name = "s3"
service-type = "Interface"
vpc-endpoint-type = "Interface"

port = "5432"
protocol = "tcp"
description = "Allow PSQL"