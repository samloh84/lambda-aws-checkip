provider "aws" {
  region = "ap-southeast-1"
}
terraform {
  backend "s3" {
    bucket = "guacamole-s3-tf-backend"
    key = "guacamole/open-sesame/terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "guacamole-dynamodb-tf-backend"
  }
}

module "vpc" {
  source = "./vpc"
  common_tags = var.common_tags
  name = "open_sesame"
}

module "lambda" {
  source = "./lambda_api_gateway"
  vpc_id = module.vpc.vpc_id
  common_tags = var.common_tags
  lambda_zip_path = "${path.cwd}/../outputs/lambda.zip"
  name = "open_sesame_lambda"
}

