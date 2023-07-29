# terraform/variables.tf

variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

# Add any other variables used in the main configuration here.
