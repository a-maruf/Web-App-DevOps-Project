# Web-App-DevOps-Project/main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = ""
  client_secret   = ""
  subscription_id = ""
  tenant_id       = ""
  skip_provider_registration = "true"
}