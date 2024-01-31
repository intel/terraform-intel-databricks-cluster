terraform {
  required_providers {
    azurerm = "~> 3.48"
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.14.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31"
    }
  }

}

