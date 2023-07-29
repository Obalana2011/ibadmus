# terraform/modules/cloudfront/outputs.tf

output "cloudfront_id" {
  value = aws_cloudfront_distribution.static_website_distribution.id
}
