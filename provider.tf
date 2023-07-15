# Define the provider and region

#####################################################
# Terraform backend and cloud providers' definition #
#####################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
}
