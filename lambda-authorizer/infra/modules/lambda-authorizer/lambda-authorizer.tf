resource "aws_lambda_function" "lambda_authorizer" {
  function_name = var.function_name  
  handler = var.handler 
  runtime = var.runtime                 
  memory_size = var.memory_size
  timeout = var.timeout 

  filename         = data.archive_file.lambda_authorizer_artifact.output_path
  source_code_hash = data.archive_file.lambda_authorizer_artifact.output_base64sha256

  role = aws_iam_role.lambda_authorizer.arn

  environment {
    variables = {
      CLIENT_ID = var.client_id
      POOL_ID = var.id_user_pools
      SECRET_KEY_JWT = var.secret_key_jwt
    }
  }
}

resource "aws_lambda_permission" "api_gtw_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
}
