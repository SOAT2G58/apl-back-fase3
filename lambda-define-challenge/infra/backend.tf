terraform {
  backend "s3" {
    bucket         = "s3-paulo-terraform"
    key            = "terraform/lambda-prechallengecognito/terraform.tfstate"
    region         = "us-east-1"
  }
}



