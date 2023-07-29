# terraform/modules/api_gateway/outputs.tf

output "api_gateway_id" {
  value = aws_api_gateway_rest_api.website_visitors_api.id
}
