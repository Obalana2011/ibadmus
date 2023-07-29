# terraform/modules/dynamodb/main.tf

resource "aws_dynamodb_table" "website_visitors_table" {
  name           = "website_visitors"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.website_visitors_table.arn
}
