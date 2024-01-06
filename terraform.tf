variable "domain_name" {
  type = string
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "hedberg-terraform-states"
    key    = var.domain_name
    region = "eu-north-1"
  }
}

module "website" {
  source      = "./terraform/"
  domain_name = var.domain_name
}
