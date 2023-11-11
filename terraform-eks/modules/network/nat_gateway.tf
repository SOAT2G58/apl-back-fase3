# #eip é um ednereço válido pra internet  
# resource "aws_eip" "vpc_eip" {
#     domain = "vpc"

#     tags = {
#         Name = format("%s-eip", var.cluster_name)
#     }   
# }

# resource "aws_nat_gateway" "nat_gateway" {
#     allocation_id = aws_eip.vpc_eip.id
#     subnet_id = aws_subnet.public_subnet_1a.id

#     tags = {
#         Name = format("%s-nat-gateway", var.cluster_name)
#     }
# }

# resource "aws_route_table" "nat_gateway_route_table" {
#     vpc_id = aws_vpc.cluster_vpc.id

#      tags = {
#         Name = format("%s-nat-gateway-route-table", var.cluster_name)
#     }
# }

# resource "aws_route" "private_internet_access" {
#     route_table_id = aws_route_table.nat_gateway_route_table.id
#     destination_cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway.id
# }