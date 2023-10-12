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
Espresso is a concentrated coffee made by forcing hot water through finely-ground coffee beans. 
It has a rich, bold flavor, a creamy crema, and serves as the base for various coffee drinks like cappuccinos and lattes. 
It's enjoyed for its intense, aromatic qualities.
DESCRIPTION
  domain_name = module.terrahouse.cloudfront_url
  town = "cooker-cove"
  content_version = 1
}