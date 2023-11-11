terraform {
  backend "s3" {
    bucket         = "s3-paulo-terraform"
    key            = "terraform/cognito/terraform.tfstate"
    region         = "us-east-1"
  }
}



