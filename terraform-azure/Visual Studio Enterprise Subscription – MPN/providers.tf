terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.98.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "f857fc6e-173a-4826-a3a5-c51fdca01b2c"
}