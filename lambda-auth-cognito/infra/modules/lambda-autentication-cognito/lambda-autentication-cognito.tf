resource "aws_lambda_function" "lambda_autentication_cognito" {
  function_name = var.function_name  
  handler = var.handler 
  runtime = var.runtime                 
  memory_size = var.memory_size
  timeout = var.timeout 

  filename         = data.archive_file.lambda_autentication_cognito_artifact.output_path
  source_code_hash = data.archive_file.lambda_autentication_cognito_artifact.output_base64sha256

  role = aws_iam_role.lambda_autentication_cognito.arn

  environment {
    variables = {
      CLIENT_ID = var.client_id
      CLIENT_SECRET = data.aws_cognito_user_pool_client.client.client_secret
      POOL_ID = var.id_user_pools
      REGION = var.aws_region
    }
  }
}


resource "aws_lambda_permission" "api_gtw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
}
