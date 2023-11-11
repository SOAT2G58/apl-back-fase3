resource "aws_iam_role" "lambda_authorizer" {
  name = "lambda_authorizer"

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


resource "aws_iam_policy" "lambda_authorizer_policy" {
  name        = "lambda_authorizer_policy"
  description = "Permissões para Lambda acessar Cognito User Pool"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "cognito-idp:GetUserAttributeVerificationCode",
          "cognito-idp:VerifySoftwareToken",
          "cognito-idp:ListUsers",
          "cognito-idp:DefineAuthChallenge",
          "cognito-idp:AdminInitiateAuth"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:cognito-idp:${var.aws_region}:${var.id_conta}:userpool/${var.id_user_pools}",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_authorizer_attachment" {
  policy_arn = aws_iam_policy.lambda_authorizer_policy.arn
  role       = aws_iam_role.lambda_authorizer.name
}