# terraform/modules/cloudfront/main.tf

resource "aws_cloudfront_distribution" "prod_distribution" {
    origin {
        domain_name = aws_s3_bucket.frontend_bucket.website_endpoint
        origin_id = "S3-${aws_s3_bucket.frontend_bucket.bucket}"

        custom_origin_config {
            http_port = 80
            https_port = 443
            origin_protocol_policy = "http-only"
            origin_ssl_protocols = ["TLSv1", "TLSv1.1", "TLSv1.2"]
        }
    }
    # By default, show index.html file
    enabled = true

    # If there is a 404, return index.html with a HTTP 200 Response
    custom_error_response {
        error_caching_min_ttl = 3000
        error_code = 404
        response_code = 200
        response_page_path = "/index.html"
    }

    default_cache_behavior {
        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = "S3-${aws_s3_bucket.frontend_bucket.bucket}"

        # Forward all query strings, cookies and headers
        forwarded_values {
            query_string = true

            cookies {
        forward = "none"
      }

        }

        
        viewer_protocol_policy = "allow-all"
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400

    }

    # Distributes content to US and Europe

    # Restricts who is able to access this content
    restrictions {
        geo_restriction {
            # type of restriction, blacklist, whitelist or none
            restriction_type = "none"
        }
    }

    # SSL certificate for the service.
    viewer_certificate {
        cloudfront_default_certificate = true
    }

    
}

output "cloudfront_link" {
    value = aws_cloudfront_distribution.prod_distribution.domain_name
}
