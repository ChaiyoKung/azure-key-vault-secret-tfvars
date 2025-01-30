terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.16.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "28bd5fa2-47f8-46e7-9fc9-690213f03d8c"
  features {}
}
