output "vpc" {
    value = aws_vpc.rds_vpc
}

output "public_subnet_1a" {
    value = aws_subnet.subnet_public_1
}

output "public_subnet_1b" {
    value = aws_subnet.subnet_public_2
}

output "security_id" {
    value = aws_security_group.rds_security_group
}