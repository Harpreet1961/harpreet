variable "cidr_vpc" {
  type        = string
  description = "cidr of vpc"
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
}



variable "public_subnet_name" {
  type        = string
  description = "public subnet name"
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
