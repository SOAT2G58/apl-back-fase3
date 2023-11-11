module "userpools" {
    source       = "./modules/pools"
}

module "client" {
    source            = "./modules/client"
    aws_cognito_user_pool_id = module.userpools.user_pool_id
}