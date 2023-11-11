data "archive_file" "lambda_authorizer_artifact" {
  output_path = "files/lambda-authorizer.zip"
  type        = "zip"
  source_file = "${path.module}/../../../code/lambda-authorizer.py"
}