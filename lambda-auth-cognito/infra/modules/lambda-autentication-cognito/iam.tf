resource "aws_iam_role" "lambda_autentication_cognito" {
  name = "lambda_autentication_cognito"

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


resource "aws_iam_policy" "lambda_cognito_policy" {
  name        = "lambda-cognito-policy"
  description = "Permissões para Lambda acessar Cognito User Pool"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "cognito-idp:AdminInitiateAuth",
          "cognito-idp:AdminRespondToAuthChallenge",
          "cognito-idp:AdminAddUserToGroup",
          "cognito-idp:DefineAuthChallenge",
          "cognito-idp:AdminCreateUser",
          "cognito-idp:AdminDeleteUser",
          "cognito-idp:AdminDisableUser",
          "cognito-idp:AdminEnableUser",
          "cognito-idp:AdminGetUser",
          "cognito-idp:AdminListGroupsForUser",
          "cognito-idp:AdminRemoveUserFromGroup",
          "cognito-idp:AdminResetUserPassword",
          "cognito-idp:AdminSetUserSettings"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:cognito-idp:${var.aws_region}:${var.id_conta}:userpool/${var.id_user_pools}",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "lambda_cognito_attachment" {
  policy_arn = aws_iam_policy.lambda_cognito_policy.arn
  role       = aws_iam_role.lambda_autentication_cognito.name
}