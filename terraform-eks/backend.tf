terraform {
  backend "s3" {
    bucket         = "s3-paulo-terraform"
    key            = "terraform/eks/terraform.tfstate"
    region         = "us-east-1"
  }
}



