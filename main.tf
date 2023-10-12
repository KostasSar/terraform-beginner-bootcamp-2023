provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid 
  token = var.terratowns_access_token
}

module "terrahouse" {
  source = "./modules/terrahouse"
  website_bucket_name = var.website_bucket_name
  user_uuid = var.teacherseat_user_uuid
  index_path = var.index_path
  error_path = var.error_path
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "How to make Espresso"
  description = <<DESCRIPTION
Espresso is a short coffee drink.
DESCRIPTION
  domain_name = module.terrahouse.cloudfront_url
  town = "missingo"
  content_version = 1
}