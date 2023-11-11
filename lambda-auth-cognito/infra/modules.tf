module "lambda-pre-challenge-cognito" {
    source        = "./modules/lambda-autentication-cognito"
    aws_region    = var.aws_region
    id_user_pools = var.id_user_pools 
    client_id     = var.client_id 
    function_name = var.function_name 
    handler       = var.handler 
    runtime       = var.runtime 
    memory_size   = var.memory_size # Tamanho da memória em MBmemory_size 
    timeout       = var.timeout # Tempo limite da função em segundostimeout 
    id_conta      = var.id_conta 

}
