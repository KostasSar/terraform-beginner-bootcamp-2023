module "terrahouse" {
  source = "./modules/terrahouse"
  user_uuid = var.user_uuid
  website_bucket_name = var.website_bucket_name

  index_path = "${path.root}/public/index.html"
  error_path = "${path.root}/public/error.html"

  content_version = var.content_version
}