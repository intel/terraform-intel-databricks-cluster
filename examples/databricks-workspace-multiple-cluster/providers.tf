provider "databricks" {
  host     = "https://accounts.cloud.databricks.com"
  username = var.dbx_account_username
  password = var.dbx_account_password
}

// Initialize the Databricks provider in "normal" (workspace) mode.
// See https://registry.terraform.io/providers/databricks/databricks/latest/docs#authentication
provider "databricks" {
  alias    = "cluster"
  host     = module.databricks_workspace.dbx_host
  username = var.dbx_account_username
  password = var.dbx_account_password
}
