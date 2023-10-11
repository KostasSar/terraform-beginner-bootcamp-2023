terraform {
  # cloud {
  #   organization = "CloudEniac"
  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }

  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}