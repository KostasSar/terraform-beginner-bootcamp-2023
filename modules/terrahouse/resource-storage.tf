resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.website_bucket_name
  tags = {
    UserUuid = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "static_website_configuration" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  key    = "index.html"
  source = var.index_path
  content_type = "text/html"

  etag = filemd5(var.index_path)
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  key    = "error.html"
  source = var.error_path
  content_type = "text/html"

  etag = filemd5(var.error_path)
}

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = {
      "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
      "Effect" = "Allow",
      "Principal" = {
        "Service" = "cloudfront.amazonaws.com"
      },
      "Action" = "s3:GetObject",
      "Resource" = "arn:aws:s3:::${aws_s3_bucket.static_website_bucket.id}/*",
      "Condition" = {
      "StringEquals" = {
          "AWS:SourceArn": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
        }
      }
    }
  })
}