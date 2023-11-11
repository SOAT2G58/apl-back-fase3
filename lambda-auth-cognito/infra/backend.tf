terraform {
  backend "s3" {
    bucket         = "s3-paulo-terraform"
    key            = "terraform/lambda-autentication-cognito/terraform.tfstate"
    region         = "us-east-1"
  }
}



