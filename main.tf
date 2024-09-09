locals {
  #Based on the cloud, it chooses the correct instance type for the dbx cluster
  node_type_id = var.dbx_cloud == "aws" ? var.aws_dbx_node_type_id : var.azure_dbx_node_type_id

  #If the enable_intel_tags is true, then additional Intel tags will be added to the resources created
  tags = var.enable_intel_tags ? merge(var.intel_tags, var.tags) : var.tags
}
resource "databricks_token" "pat" {
  # provider         = databricks.created_workspace
  comment          = "Terraform Provisioning"
  lifetime_seconds = 86400
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "dbx_cluster" {
  cluster_name            = var.dbx_cluster_name
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = local.node_type_id
  autotermination_minutes = var.dbx_auto_terminate_min
  runtime_engine          = var.dbx_runtime_engine
  spark_conf              = var.dbx_spark_config
  custom_tags             = local.tags

  autoscale {
    min_workers = var.dbx_autoscale_min_workers
    max_workers = dbx_autoscale_max_workers
  }
  cluster_log_conf {
    dbfs {
      destination = "dbfs:/FileStore/logs"
    }
  }
}

