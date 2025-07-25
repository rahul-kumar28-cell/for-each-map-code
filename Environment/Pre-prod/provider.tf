terraform {
  backend "azurerm" {
    resource_group_name  = "rg-moto"
    storage_account_name = "macstorage342"
    container_name       = "jalebicontainer"
    key                  = "samosa.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c64cf66f-900c-4cad-b6cd-ee68a9839e8a"
}
