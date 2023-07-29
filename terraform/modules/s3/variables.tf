# terraform/modules/s3/variables.tf

variable "bucket_name" {
  description = "Name of the S3 bucket."
  type        = string
  default     = "ibadmus-resume-bucket-name"
}

# Add any other variables related to S3 here if needed.
