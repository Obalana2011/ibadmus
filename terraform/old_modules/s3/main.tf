# terraform/modules/s3/main.tf

resource "aws_s3_bucket" "frontend_bucket" {
    bucket = "ibadmus-resume-site-bucket"
    force_destroy = true
    acl = "public-read"
}
 
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.frontend_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "allow_public_access" {
    bucket = aws_s3_bucket.frontend_bucket.id
    
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::ibadmus-resume-site-bucket/*"
            ]
        }
    ]
}
POLICY
}


resource "aws_s3_bucket_cors_configuration" "frontend_bucket_cors" {
    bucket = aws_s3_bucket.frontend_bucket.id

    cors_rule {
      allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    }

    cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_website_configuration" "bucket_config" {
    bucket = aws_s3_bucket.frontend_bucket.id
    index_document {
        suffix = "index.html"
    }
}

