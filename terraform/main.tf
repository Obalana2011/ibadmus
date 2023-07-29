# terraform/main.tf

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "ibadmus-resume-state-bucket"
    key    = "your-terraform-state-key"
    region = "us-east-1"  # Replace with your preferred region
  }
}

module "s3" {
  source = "./modules/s3"
}

module "lambda" {
  source = "./modules/lambda"
}

module "api_gateway" {
  source = "./modules/api_gateway"
}

module "cloudfront" {
  source = "./modules/cloudfront"
  acm_certificate_arn = "YOUR_ACM_CERTIFICATE_ARN"  # Replace with your ACM certificate ARN
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

output "cloudfront_domain" {
  value = module.cloudfront.cloudfront_domain_name
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}

output "dynamodb_table_arn" {
  value = module.dynamodb.dynamodb_table_arn
}
