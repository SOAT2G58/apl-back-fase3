resource "aws_cognito_user_pool_client" "user_pool_client" {
  name = "cognito-user-pool-client"
  user_pool_id = var.aws_cognito_user_pool_id
  generate_secret = true
  explicit_auth_flows = ["CUSTOM_AUTH_FLOW_ONLY"]

  # callback_urls = ["https://example.com/callback"]
  # allowed_oauth_flows_user_pool_client = true
  # allowed_oauth_scopes = ["openid", "email", "profile"]

}