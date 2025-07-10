terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  
  backend "s3" {
    bucket         = "secure-state-testing"
    key            = "aws_bucket_secure_state_test"
    region         = "us-east-1"
    # dynamodb_table = "84sawsdynamotable" #old locking
    encrypt      = true  
    use_lockfile = true  #S3 native locking
  }
}

provider "aws" {
  # Configuration options
}