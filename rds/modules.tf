module "network" {
    source       = "./modules/network"
    aws_region = var.aws_region
}

module "rds" {
    source       = "./modules/rds"
    aws_region = var.aws_region
    subnet_ids =  [module.network.public_subnet_1a.id,module.network.public_subnet_1b.id]
    vpc_security_group_ids = [module.network.security_id.id]
}