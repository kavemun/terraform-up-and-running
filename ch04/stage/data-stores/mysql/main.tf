provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {

    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    bucket         = "aws-terraform-states-1023"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true

  }
}

data "terraform_remote_state" "db" {
  backend = "s3" 

  config = {
    bucket         = "aws-terraform-states-1023"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "us-east-2"
  }
}
