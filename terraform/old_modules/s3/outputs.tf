# terraform/modules/s3/outputs.tf

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.frontend_bucket.id
}

output "bucket_ownership_controls_rule" {
  description = "Ownership controls rule for the S3 bucket"
  value       = aws_s3_bucket_ownership_controls.example.rule[0].object_ownership
}

output "bucket_policy" {
  description = "Policy attached to the S3 bucket for public access"
  value       = aws_s3_bucket_policy.allow_public_access.policy
}

output "bucket_cors_configuration" {
  description = "CORS configuration for the S3 bucket"
  value       = aws_s3_bucket_cors_configuration.frontend_bucket_cors
}

output "bucket_website_configuration" {
  description = "Website configuration for the S3 bucket"
  value       = aws_s3_bucket_website_configuration.bucket_config
}

