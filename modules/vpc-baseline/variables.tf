variable "cidr_vpc" {
  type        = string
  description = "cidr of vpc"
}

variable "secondcidr_vpc" {
  type = string
  description = "Secondary cidr of  VPC"
  
}

variable "enable" {
  type = bool
  default = true  
  
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
}



variable "public_subnet_name" {
  type        = string
  description = "public subnet name"
}

variable "private_subnet_name" {
  type = string
  description = "private subnet name"
  
}

variable "internet_gateway" {
  type        = string
  description = "internet gateway"
}

variable "public_route" {
  type        = string
  description = "public route"
}


variable "public_subnets" {
  type        = string
  description = "public subnets"
}

variable "private_subnets" {
  type = string
  description = "private subnets"
  
}

variable "nat-gateway" {

  type = string
  description = "Nat Gateway Name"
  
}

variable "private_route" {
  type = string
  description = "Name of Nat Private Route"
  
}