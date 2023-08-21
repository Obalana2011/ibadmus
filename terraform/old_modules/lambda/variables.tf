# terraform/modules/lambda/variables.tf

variable "lambda_function_name" {
  description = "Name of the Lambda function."
  type        = string
  default     = "website-visitors-counter"
}

# Add any other variables related to Lambda here if needed.
