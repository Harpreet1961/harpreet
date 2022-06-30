# # variable "vpc_id" {
# #     type = string
      
# # }

# # variable "route_tables" {
# #   type = list
# # }


# # variable "transit-name" {
# #     type = string
  
# # }

# # variable "transit-routes" {
# #   type = string
# # }

# # variable "transit_gateway_id" {
  
# # }

# # variable "transit_subnets" {
# #   type = list(string)
# # }

variable "tfc_tgw_object" {
  type = map(object({
    #vpc_id  = string,
    transit_subnets = string,
    transit-name = string,
    transit-routes = string,
    availability_zone = string
    #transit_gateway_id=string
   
  }))
}

variable "transit_gateway_id" {
  type = string
}

variable "vpc_id" {
  type = string

}
variable "tgw-attachment-name" {
  type = string
}

