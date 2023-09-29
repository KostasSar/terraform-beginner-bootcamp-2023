resource "random_string" "bucket_random_string" {
  lower = true
  upper = false
  special  = false
  length   = 16
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = format("%s%s","terraform-beginner-bootcamp-",random_string.bucket_random_string.result)
  tags = {
    UserUuid = var.user_uuid
  }
}
