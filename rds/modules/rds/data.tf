data "aws_secretsmanager_secret" "my_database_secret" {
  name = "postgres"  # Substitua pelo nome da sua secret
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.my_database_secret.id
}