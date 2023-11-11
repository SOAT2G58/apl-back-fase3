resource "aws_cognito_user_pool" "user_pool" {
  name = "cognito-user-pool"
    //step 1
  alias_attributes = ["preferred_username"]  # Especifique os atributos que servirão como nome de usuário
  auto_verified_attributes = []  # Atributos que serão verificados automaticamente
  mfa_configuration = "OFF"
  
  username_configuration {
    case_sensitive = false
  }

  //step 2

    password_policy {
      minimum_length = 6
      require_lowercase = false
      require_numbers = false
      require_symbols = false
      require_uppercase = false
      temporary_password_validity_days = 0
    }

    # self_service_sign_up = false

    # //step 3
    # self_sign_up = false
    # auto_verify_attribute = ""



  schema {
    name = "name"
    attribute_data_type = "String"
    required = true
    mutable  = true
  }

  schema {
    name = "email"
    attribute_data_type = "String"
    required = true
    mutable  = true
  }

  schema {
    name = "cpf"
    attribute_data_type = "String"
    required = false
    mutable  = true
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
    # reply_to_address = "noreply@verificationemail.com"
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
  }

   account_recovery_setting {    
     recovery_mechanism {
      name     = "admin_only"
      priority = 1
    }
  }

  # software_token_mfa_configuration {
  #   enabled = false
  # }

#  precisa subir o lambda primeiro
 lambda_config {
    define_auth_challenge = data.aws_lambda_function.lambda_prechallenge_cognito.arn
  }
}


