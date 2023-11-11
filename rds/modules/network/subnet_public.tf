resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = aws_vpc.rds_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       =  format("%sa", var.aws_region)
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = aws_vpc.rds_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       =  format("%sb", var.aws_region)
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "public_1" {
    subnet_id = aws_subnet.subnet_public_1.id
    route_table_id = aws_route_table.internet_gateway_route_table.id
}

resource "aws_route_table_association" "public_2" {
    subnet_id = aws_subnet.subnet_public_2.id
    route_table_id = aws_route_table.internet_gateway_route_table.id
}