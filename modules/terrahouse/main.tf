resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.website_bucket_name
  tags = {
    UserUuid = var.user_uuid
  }
}