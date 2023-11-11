# resource "aws_subnet" "private_subnet_1a" {
#     vpc_id                  = aws_vpc.cluster_vpc.id
#     cidr_block              = "10.0.32.0/20"
#     map_public_ip_on_launch = false
#     availability_zone       = format("%sa", var.aws_region)

#     tags = {
#         Name = format("%s-private-1a", var.cluster_name),
#         "kubernetes.io/cluster/${var.cluster_name}" = "shared",
#         "kubernetes.io/role/internal-elb" = "1"
#     }
# }

# resource "aws_subnet" "private_subnet_1b" {
#     vpc_id                  = aws_vpc.cluster_vpc.id
#     cidr_block              = "10.0.48.0/20"
#     map_public_ip_on_launch = false
#     availability_zone       = format("%sb", var.aws_region)

#     tags = {
#         Name = format("%s-private-1b", var.cluster_name),
#         "kubernetes.io/cluster/${var.cluster_name}" = "shared",
#          "kubernetes.io/role/internal-elb" = "1"
#     }
# }

# resource "aws_route_table_association" "private_1a" {
#     subnet_id = aws_subnet.private_subnet_1a.id
#     route_table_id = aws_route_table.nat_gateway_route_table.id
# }

# resource "aws_route_table_association" "private_1b" {
#     subnet_id = aws_subnet.private_subnet_1b.id
#     route_table_id = aws_route_table.nat_gateway_route_table.id
# }