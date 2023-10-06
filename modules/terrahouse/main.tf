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