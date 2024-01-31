terraform {
  required_providers {
    azurerm = "~> 3.86"
    random  = "~> 3.4.3"
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.14.2"
    }
  }

}