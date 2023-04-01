terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.0.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "5c265d3c-ff46-4102-8c22-6ea6615689ad"
  client_id       = "ab71d883-6e83-44b3-a3e6-03b014c423d0"
  client_secret   = "5b68Q~Y-xnWzZOvfy1ckErbKLF2UrGTxjcoo8aYS"
  tenant_id       = "3eed6cf0-578f-4fdc-8c56-b41a9db82a11"

  features {}
}