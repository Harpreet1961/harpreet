/*# variables
variable "account_number" {
  type        = string
  description = "AWS Account Number"
}*/

variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region for deployments"
}


/*variable "public_subnets" {
  type        = string
  description = "public subnets"
}*/

# variable "vpc-private-subnet-cidr" {
#   type = list(string)
# }

# variable "vpc-infra-subnet-cidr" {
#   type = list(string)
# }


# variable "cidr_vpc" {
#   type        = string
#   description = "cidr of vpc"
# }

# variable "secondcidr_vpc" {
#   type = string
#   description = "Secondary CIDR of VPC"
  
# }

# /*variable "public_subnet_name" {
#   type        = string
#   description = "public subnet name"
# }*/

# variable "private_subnet_name" {
#   type        = string
#   description = "public subnet name"
# }


# /*variable "internet_gateway" {
#   type        = string
#   description = "internet gateway"
# }

# variable "public_route" {
#   type        = string
#   description = "public route"
# }*/

# variable "vpc_name" {
#   type        = string
#   description = "vpc name"
# }

# /*variable "nat-gateway" {

#   type = string
#   description = "Name of NAT Gateway"
  
# }

# variable "private_route" {
#   type = string
#   description = "Private Route"
  
# }
# */
# /*variable "cidr_infra" {
#   type = string
#   description = "CIDR Range of Infra Subnets"
  
# }*/
# variable "infra-subnets" {
#   type = string
#   description = "Name of Infra"
  
# }


# /*variable "vpc_id" {
#     type = string
      
# }*/

# variable "instance-tenancy" {
#   default = "default"
# }
# variable "enable-dns-support" {
#   default = "true"
# }

# variable "enable-dns-hostnames" {
#   default = "true"
# }




# /*variable "transit-name" {
#     type = string
  
# }

# variable "transit-routes" {
#   type = string
# }

# variable "transit_gateway_id" {
  
# }
# variable "transit_subnets" {
#   type = list(string)
# }*/


variable "tfc_vpc_object" {
  type = map(object({
    cidr_vpc  = string,
    vpc_name = string,
    instance-tenancy = string,
    enable-dns-support = bool,
    enable-dns-hostnames  = bool
    
    secondcidr_vpc  = string,
    # vpc-private-subnet-cidr = string, 
    # vpc-infra-subnet-cidr = string,
    # private_subnet_name = string,
    # infra-subnets = string
  }))
}

variable "tfc_subnet_object" {
  type = map(object({
    # secondcidr_vpc  = string
    vpc-private-subnet-cidr = string, 
    vpc-infra-subnet-cidr = string,
    private_subnet_name = string,
    infra-subnets = string,
    availability_zone = string,
     pvt-route-name = string ,
    infra-route-name = string
  }))
}

variable "tfc_tgw_object" {
  type = map(object({
   # vpc_id  = string,
    transit_subnets = string,
    transit-name = string,
    transit-routes = string,
    availability_zone = string
    #transit_gateway_id=string  
  }))
}

# variable "vpc_id" {
#   type = string

# }

variable "tfc-bucket-object" {
  type = map(object({
    bucket  = string,
    #bucket_prefix = string,
    acl = string,
    #tags = string,
    force_destroy  = bool,
    acceleration_status  = string,
    request_payer = string,
    versioning = string,
    environment_name = string
    #policy = string
    # vpc-private-subnet-cidr = string, 
    # vpc-infra-subnet-cidr = string,
    # private_subnet_name = string,
    # infra-subnets = string
  }))
}



variable "tgw-attachment-name" {
  type = string
}





# variable "cidr_tgw" {
#   type = string
# }

# variable "cidr_vpc" {
#     type = string
  
# }

# variable "vpc_id" {
#     type = string
  
# }

variable "sg_name" {
  type = string
  
}

 variable "flow-log" {
  type = string
}

variable "cloudwatch-logs-name" {
  type = string
  
}

variable "flow-log-role-name" {
  type = string
  
}

variable "service-name" {
  type = string
  
}

variable "service-type" {
  type = string
  
}

variable "vpc-endpoint-type" {
  type = string
  
}

variable "port" {
  type = number
 # default = "5432"
    
}

variable "protocol" {
  type = string
 # default = "tcp"
  
}

variable "description" {
  type = string
 # default = "Allo psql"
  
}