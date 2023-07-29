# terraform/modules/s3/main.tf

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

output "bucket_id" {
  value = aws_s3_bucket.website_bucket.id
}
