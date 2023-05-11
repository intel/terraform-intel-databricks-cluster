#This example creates an databricks workspace with the default Credentials, Storage and Network Configurations and Multiple Databricks Cluster with Intel Optimizations. For more information on usage configuration, use the README.md
module "databricks_workspace" {
  source               = "intel/aws-databricks-workspace/intel"
  vpc_id               = var.vpc_id
  dbx_account_id       = var.dbx_account_id
  dbx_account_password = var.dbx_account_password
  dbx_account_username = var.dbx_account_username
  vpc_subnet_ids       = var.vpc_subnet_ids
  security_group_ids   = var.security_group_ids
}

module "databricks_cluster" {
  source               = "intel/databricks-cluster/intel"
  dbx_host             = module.databricks_workspace.dbx_host
  dbx_cloud            = var.dbx_cloud
  depends_on = [
    module.databricks_workspace
  ]
  providers = {
    databricks = databricks.cluster
  }
  tags = {
    "owner"  = "user.example@intel.com"
    "module" = "Intel-Cloud-Optimization-Module"
  }
}

module "databricks_cluster_2" {
  source               = "intel/databricks-cluster/intel"
  dbx_host             = module.databricks_workspace.dbx_host
  dbx_cloud            = var.dbx_cloud
  dbx_cluster_name     = "dbx_optimized_cluster_2"
  depends_on = [
    module.databricks_workspace
  ]
  providers = {
    databricks = databricks.cluster
  }
  tags = {
    "owner"  = "user.example@intel.com"
    "module" = "Intel-Cloud-Optimization-Module"
  }
}