terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.47.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

module "groups" {
  source = "./modules/groups"
}

module "policies" {
  source   = "./modules/policies"
  location = var.location
}
