# terraform/modules/cloudfront/variables.tf

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for CloudFront."
  type        = string
}

# Add any other variables related to CloudFront here if needed.
