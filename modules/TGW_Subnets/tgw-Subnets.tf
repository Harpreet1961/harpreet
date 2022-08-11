# # resource "aws_subnet" "transit" {
# #   count = length(var.transit_subnets)

# #   vpc_id = "${var.vpc_id}"
# #   cidr_block = var.transit_subnets[count.index]

# #   tags = {
# #     "Name" = var.transit-name
# #   }
  

# # }


locals {
  subnet_obj = flatten(
   [
     for k in aws_subnet.transit: [
           {
              subnet_ids = k.id
           }
     ]
   ]
 )
}

resource "aws_subnet" "transit" {
  for_each = var.tfc_tgw_object
  availability_zone =  "${each.value.availability_zone}"
  vpc_id = var.vpc_id
  cidr_block = "${each.value.transit_subnets}"

  tags = {
    "Name" = "${each.value.transit-name}"
  }
  

}


resource "aws_route_table" "transit" {
  for_each = var.tfc_tgw_object
   vpc_id = var.vpc_id
   route {
   
  cidr_block = "10.0.0.0/8"
  transit_gateway_id = data.aws_ec2_transit_gateway.tgw.id
  

   }

  tags = {
    "Name" = "${each.value.transit-routes}"
  }
  
}

data "aws_ec2_transit_gateway" "tgw" {
  id = "tgw-0fcc34220e6eaa9e2"
  
}

resource "aws_ec2_transit_gateway_vpc_attachment" "TGW-attachment" {
  count = (null != var.transit_gateway_id) ? 1 : 0
  #for_each  =   { for k, v in var.tfc_tgw_object : k => v if var.transit_gateway_id != null}
  #for_each  =   { for k, v in var.count1 : k => v if var.transit_gateway_id != null}
  #subnet_ids =  aws_subnet.transit[each.key].id
  subnet_ids = "${local.subnet_obj.*.subnet_ids}"
  transit_gateway_id = data.aws_ec2_transit_gateway.tgw.id
  tags = {
    "Name" = var.tgw-attachment-name
  }
  vpc_id = var.vpc_id
   
}


resource "aws_route_table_association" "transit" {
  for_each  =   { for k, v in var.tfc_tgw_object : k => v if var.transit_gateway_id != null}
  subnet_id = aws_subnet.transit[each.key].id
  route_table_id = aws_route_table.transit[each.key].id
    
}


# # resource "aws_route_table" "transit" {
# #   count = (null != var.transit_gateway_id) ? length(var.transit_subnets) : 0
# #    vpc_id = var.vpc_id

# #   tags = {
# #     "Name" = var.transit-routes
# #   }
  
# # }

# data "aws_ec2_transit_gateway" "tgw" {
  
  
# }


# resource "aws_route" "transit_routes" {
#     for_each = var.tfc_tgw_object
#     route_table_id = aws_route_table.transit[each.key].id
#     destination_cidr_block = "10.0.0.0/8"
#     transit_gateway_id = "tgw-01a5fc3e6e83e1b31"
# }

# /*resource "aws_route" "transit_routes" {
#   count = length(var.transit_subnets)
#   route_table_id = aws_route_table.transit[count.index].*.id
#   destination_cidr_block = "10.0.0.0/8"
#   transit_gateway_id = var.transit_gateway_id

# }*/

# resource "aws_route_table_association" "transit" {
#   count = length(var.transit_subnets)
#   subnet_id = element(aws_subnet.transit.*.id, count.index)
#   route_table_id = element(aws_route_table.transit.*.id, count.index)
    
# }

# resource "aws_route" "transit" {
#   count = length(var.route_tables)
#   #route_table_id = var.route_tables[count.index]
#   route_table_id = element(aws_route_table.transit.*.id, count.index)
#   destination_cidr_block = "10.0.0.0/8"
#   transit_gateway_id = var.transit_gateway_id
  
# }

# data "aws_ec2_transit_gateway" "tgw" {
#   id = var.transit_gateway_id
  
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "TGW-attachment" {
#   count = (null != var.transit_gateway_id) ? 1 : 0
#   subnet_ids =  aws_subnet.transit.*.id
#   transit_gateway_id = data.aws_ec2_transit_gateway.tgw.id
#   vpc_id = var.vpc_id
   
# }