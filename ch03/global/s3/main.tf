provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "aws-terraform-states-1023"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"

    dynamodb_table = "terraform-locks"
    encrypt        = true 
  }
}

