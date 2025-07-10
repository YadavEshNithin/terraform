terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }


  backend "s3" {
    bucket         = "84sawsbucket"
    key            = "aws_provider_bucket_key"
    region         = "us-east-1"
    # dynamodb_table = "84sawsdynamotable" #old locking
    encrypt      = true  
    use_lockfile = true  #S3 native locking
  }
}



provider "aws" {
  # Configuration options
}
