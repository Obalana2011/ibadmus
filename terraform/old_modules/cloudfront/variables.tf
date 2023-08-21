# terraform/modules/cloudfront/variables.tf
# variables.tf

variable "frontend_bucket_name" {
  description = "Name of the S3 bucket for the frontend content"
  default = "ibadmus-resume-site-bucketS"
}

variable "frontend_bucket_acl" {
  description = "ACL for the S3 bucket"
  default     = "public-read"
}


variable "allowed_methods" {
  description = "Allowed methods for CORS configuration"
  default     = ["GET", "HEAD"]
}

variable "allowed_headers" {
  description = "Allowed headers for CORS configuration"
  default     = ["*"]
}

# Add more variables as needed
