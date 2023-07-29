# terraform/modules/lambda/main.tf

resource "aws_lambda_function" "website_visitors_counter" {
  function_name = var.lambda_function_name
  runtime       = "python3.8"
  handler       = "lambda_function.lambda_handler"
  filename      = "website_visitors_counter.zip"
  source_code_hash = filebase64sha256("website_visitors_counter.zip")
}

output "lambda_function_arn" {
  value = aws_lambda_function.website_visitors_counter.arn
}
