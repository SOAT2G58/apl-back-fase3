resource "aws_iam_role" "lambda_prechallenge_cognito" {
  name = "lambda_prechallenge_cognito"

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


resource "aws_iam_policy" "lambda_prechallenge_cognito" {
  name        = "lambda_prechallenge_cognito"
  description = "Permissões para Lambda acessar Cognito User Pool"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "cognito-idp:DefineAuthChallenge",
          "cognito-idp:AdminRespondToAuthChallenge"
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_cognito_attachment" {
  policy_arn = aws_iam_policy.lambda_prechallenge_cognito.arn
  role       = aws_iam_role.lambda_prechallenge_cognito.name
}