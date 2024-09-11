locals {
  content_type_map = {
    css         = "text/css"
    html        = "text/html"
    jpg         = "image/jpg"
    js          = "text/javascript"
    map         = "application/json"
    json        = "application/json"
    scss        = "text/x-scss"
    svg         = "image/svg+xml"
    eot         = "application/vnd.ms-fontobject"
    ttf         = "font/ttf"
    woff        = "font/woff"
    woff2       = "font/woff2"
  }
}

resource "aws_s3_bucket" "static_website" {
  bucket = "81da30af-3fd5-44e4-b5b6-60110b443ba5-website-static-website" // 81da30af-3fd5-44e4-b5b6-60110b443ba5 my Udacity userId
  force_destroy = true // delete all bucket objects when TF destroy
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [aws_s3_bucket.static_website]

  destroy_duration = "30s"
}

resource "aws_s3_bucket_policy" "static_website" {
  depends_on = [time_sleep.wait_30_seconds] // to avoid 403, from my experience need to wait to create a bucket completely before updating policy

  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "static_website"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.static_website.arn,
          "${aws_s3_bucket.static_website.arn}/*",
        ]
      }
    ]
  })
}

resource "aws_s3_object" "upload_website" { // inheritance from Stackoverflow.
  for_each      = fileset("../web/", "**/*.*")

  bucket        = aws_s3_bucket.static_website.id
  key           = each.value
  source        = "../web/${each.value}"
  content_type  = lookup(local.content_type_map, reverse(split(".", each.value))[0], "text/plain")
  etag          = filemd5("../web/${each.value}") // no encryption so it's ok to use etag rather than source_hash, 
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_cloudfront_origin_access_control" "static_website" {
  name                              = "static_website_origin_access"
  description                       = "Static website origin access control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "static_website_distribution" {
  origin {
    domain_name              = aws_s3_bucket.static_website.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.static_website.id
    origin_id                = aws_s3_bucket.static_website.bucket_regional_domain_name
    # Bug
    # https://github.com/hashicorp/terraform-provider-aws/issues/26850
    # https://github.com/hashicorp/terraform-provider-aws/issues/4757
  }

  enabled             = true
  comment             = "Static website"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.static_website.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
