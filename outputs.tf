output "bucket_name" {
  value = module.terrahouse.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  value = module.terrahouse.website_endpoint
}