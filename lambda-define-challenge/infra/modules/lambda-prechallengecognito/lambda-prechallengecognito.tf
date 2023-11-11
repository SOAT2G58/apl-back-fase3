data "archive_file" "lambda_prechallenge_cognito_artifact" {
  output_path = "files/lambda_prechallenge_cognito.zip"
  type        = "zip"
  source_file = "${path.module}/../../../code/lambda_prechallenge_cognito.py"
}


resource "aws_lambda_function" "lambda_prechallenge_cognito" {
  function_name = "lambda_prechallenge_cognito"  # Escolha um nome para a função Lambda
  handler = "lambda_prechallenge_cognito.lambda_handler" # O nome do arquivo e da função de manipulador
  runtime = "python3.8"                 
  memory_size = 128 # Tamanho da memória em MB
  timeout = 5 # Tempo limite da função em segundos

  filename         = data.archive_file.lambda_prechallenge_cognito_artifact.output_path
  source_code_hash = data.archive_file.lambda_prechallenge_cognito_artifact.output_base64sha256

  role = aws_iam_role.lambda_prechallenge_cognito.arn  
}

resource "aws_lambda_permission" "invoke_permission" {
  statement_id  = "InvokePermission"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_prechallenge_cognito.function_name
  principal     = "cognito-idp.amazonaws.com"//"*"  
}
# "arn:aws:cognito-idp:${var.aws_region}:${var.id_conta}:userpool/${var.id_user_pools}"