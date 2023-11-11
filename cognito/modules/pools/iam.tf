resource "aws_iam_role" "cognito_role" {
  name = "cognito_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "cognito_lambda_policy" {
  name        = "cognito-lambda-policy"
  description = "Permissões para Cognito acessar a função Lambda"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["lambda:InvokeFunction"],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cognito_lambda_attachment" {
  policy_arn = aws_iam_policy.cognito_lambda_policy.arn
  role       = aws_iam_role.cognito_role.name
}