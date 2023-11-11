data "aws_cognito_user_pool_client" "client" {
  user_pool_id = var.id_user_pools
  client_id    = var.client_id
}

data "archive_file" "lambda_autentication_cognito_artifact" {
  output_path = "files/lambda-auth.zip"
  type        = "zip"
  source_file = "${path.module}/../../../code/lambda-auth.py"
}