# terraform/modules/api_gateway/main.tf

resource "aws_api_gateway_rest_api" "website_visitors_api" {
  name        = "website-visitors-api"
  description = "API Gateway for Website Visitors"
}

resource "aws_api_gateway_resource" "proxy_resource" {
  rest_api_id = aws_api_gateway_rest_api.website_visitors_api.id
  parent_id   = aws_api_gateway_rest_api.website_visitors_api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy_method" {
  rest_api_id   = aws_api_gateway_rest_api.website_visitors_api.id
  resource_id   = aws_api_gateway_resource.proxy_resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "proxy_integration" {
  rest_api_id             = aws_api_gateway_rest_api.website_visitors_api.id
  resource_id             = aws_api_gateway_resource.proxy_resource.id
  http_method             = aws_api_gateway_method.proxy_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.website_visitors_counter.invoke_arn
}

resource "aws_api_gateway_deployment" "proxy_deployment" {
  depends_on = [
    aws_api_gateway_integration.proxy_integration,
  ]
  rest_api_id = aws_api_gateway_rest_api.website_visitors_api.id
  stage_name  = "prod"
}

output "api_gateway_url" {
  value = aws_api_gateway_deployment.proxy_deployment.invoke_url
}
