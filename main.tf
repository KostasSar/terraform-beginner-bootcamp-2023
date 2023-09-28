terraform {
  cloud {
    organization = "CloudEniac"
    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_random_string" {
  lower = true
  upper = false
  special  = false
  length   = 16
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = format("%s%s","terraform-beginner-bootcamp-",random_string.bucket_random_string.result)
}

output "bucket_name" {
  value = aws_s3_bucket.static_website_bucket.id
}
