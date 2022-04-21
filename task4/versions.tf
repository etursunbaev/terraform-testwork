terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.3"
    }
  }
  backend "s3" {
    bucket = "wkl-eldar-lab-works"
    key    = "terraform.ftstate"
    region = "us-east-1"
  }
}