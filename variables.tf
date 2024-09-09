########################
####     Intel      ####
########################
# # See policies.md, we recommend  Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake)
# Storage Optimized: i4i.large, i4i.xlarge, i4i.2xlarge, i4i.4xlarge, i4i.8xlarge, i4i.16xlarge, i4i.32xlarge
#See more:
#https://www.databricks.com/product/pricing
#https://aws.amazon.com/ec2/instance-types/i4i/
variable "aws_dbx_node_type_id" {
  description = "The type of the AWS Compute Machine that are supported by databricks."
  type        = string
  default     = "i4i.2xlarge"
}

# # See policies.md, we recommend  Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake)
# Memory Optimized: Standard_E4ds_v5, Standard_E8ds_v5, Standard_E16ds_v5, Standard_E20ds_v5, Standard_E32ds_v5, Standard_E48ds_v5, Standard_E64ds_v5, Standard_E96ds_v5
#See more:
#https://www.databricks.com/product/pricing
#https://learn.microsoft.com/en-us/azure/virtual-machines/edv5-edsv5-series
variable "azure_dbx_node_type_id" {
  description = "The type of the Azure Compute Machine that are supported by databricks."
  type        = string
  default     = "Standard_E8ds_v5"
}

#Intel Optimized Tunable Spark Config parameters
variable "dbx_spark_config" {
  description = "Key - Value pair for Intel Optimizations for Spark configuration"
  type        = map(string)
  default = {
    "spark.databricks.passthrough.enabled"                  = "true",
    "spark.databricks.adaptive.autoOptimizeShuffle.enabled" = "true",
    "spark.databricks.io.cache.enabled"                     = "true",
    "spark.databricks.io.cache.maxMetaDataCache"            = "10g",
    "spark.databricks.io.cache.maxDiskUsage"                = "100g",
    "spark.databricks.delta.preview.enabled"                = "true"
  }
}

#https://www.databricks.com/blog/2022/09/13/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake
variable "dbx_runtime_engine" {
  description = " The type of runtime engine to use. If not specified, the runtime engine type is inferred based on the spark_version value. Allowed values include: PHOTON, STANDARD."
  validation {
    condition     = contains(["PHOTON", "STANDARD"], var.dbx_runtime_engine)
    error_message = "The dbx_runtime_engine must be \"PHOTON\" or \"STANDARD\"."
  }
  type    = string
  default = "PHOTON"
}
########################
####    Required    ####
########################
variable "dbx_host" {
  type        = string
  description = "Required URL for the databricks workspace"
}

variable "dbx_cloud" {
  type        = string
  description = "Flag that decides which Cloud to use for the instance type in Databricks Cluster"
  validation {
    condition     = var.dbx_cloud == "azure" || var.dbx_cloud == "aws"
    error_message = "dbx_cloud has to be either 'azure' or 'aws'."
  }
}

########################  
####     Other      ####
########################
variable "dbx_cluster_name" {
  description = "Cluster name, which doesn’t have to be unique. If not specified at creation, the cluster name will be an empty string."
  type        = string
  default     = "dbx_optimized_cluster"
}

variable "dbx_autoscale_min_workers" {
  description = "The minimum number of workers to which the cluster can scale down when underutilized. It is also the initial number of workers the cluster will have after creation."
  type        = number
  default     = 1
}

variable "dbx_autoscale_max_workers" {
  description = " The maximum number of workers to which the cluster can scale up when overloaded. max_workers must be strictly greater than min_workers."
  type        = number
  default     = 50
}

variable "dbx_auto_terminate_min" {
  description = "Automatically terminate the cluster after being inactive for this time in minutes. If specified, the threshold must be between 10 and 10000 minutes. You can also set this value to 0 to explicitly disable automatic termination. Defaults to 60. We highly recommend having this setting present for Interactive/BI clusters."
  validation {
    condition     = var.dbx_auto_terminate_min >= 10 && var.dbx_auto_terminate_min <= 10000
    error_message = "dbx_auto_terminate_min has to between 10 and 10000 minutes"
  }
  type    = number
  default = 120
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    "key" = "value"
  }
}

variable "enable_intel_tags" {
  type        = bool
  default     = true
  description = "If true adds additional Intel tags to resources"
}

variable "intel_tags" {
  default = {
    intel-registry = "https://registry.terraform.io/namespaces/intel"
    intel-module   = "terraform-intel-databricks-cluster"
  }
  type        = map(string)
  description = "Intel Tags"
}


