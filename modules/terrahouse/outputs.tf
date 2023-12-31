output "bucket_name" {
  value = aws_s3_bucket.static_website_bucket.id
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_website_configuration.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}