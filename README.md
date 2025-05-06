<p align="center">
  <img src="https://github.com/intel/terraform-intel-databricks-cluster/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Optimized Cloud Modules for Terraform

© Copyright 2025, Intel Corporation

## Intel Optimized Databricks Cluster

The module can deploy an Intel Optimized Databricks Cluster. Instance Selection and Intel Optimizations have been defaulted in the code.

**Learn more about Intel optimizations :**
## Performance Data

<center>

#### [Faster insights With Databricks Photon Using AWS i4i Instances With the Latest Intel Ice Lake Scalable Processors](https://www.databricks.com/blog/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake-scalable)

<p align="center">
  <a href="https://www.databricks.com/blog/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake-scalable">
  <img src="https://github.com/intel/terraform-intel-databricks-cluster/blob/main/images/aws-dbx-1.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
#### [5.3x relative speed up of i4i Photon against the i3 DBR](https://www.databricks.com/blog/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake-scalable)

<p align="center">
  <a href="https://www.databricks.com/blog/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake-scalable">
  <img src="https://github.com/intel/terraform-intel-databricks-cluster/blob/main/images/aws-dbx-2.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
#### [Reduce Time to Decision With the Databricks Lakehouse Platform and Latest Intel 3rd Gen Xeon Scalable Processors](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

<p align="center">
  <a href="https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html">
  <img src="https://github.com/intel/terraform-intel-databricks-cluster/blob/main/images/azure-dbx-1.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
#### [Up to 3.0x price/performance benefits and 6.7x the speed up on Azure Edsv5](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

<p align="center">
  <a href="https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html">
  <img src="https://github.com/intel/terraform-intel-databricks-cluster/blob/main/images/azure-dbx-2.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
#### [Accelerating Azure Databricks Runtime for Machine Learning](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273)

<p align="center">
  <a href="https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273">
  <img src="https://github.com/intel/terraform-intel-databricks-cluster/blob/main/images/dbx-runtime.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
</center>

## Usage

All the examples in example folder shows how to create a Intel Optimized Databricks cluster using this module along with the Intel Cloud Optimization Module for Databricks Workspace in AWS and Azure

**Usage Considerations**
* **If you dont have pre-existing Databricks Workspace, use the Intel Cloud Optimization Module for Databricks Workspace:** 
      
    * [AWS Databricks Workspace](https://registry.terraform.io/modules/intel/aws-databricks/intel/latest)
    * [Azure Databricks Workspace](https://registry.terraform.io/modules/intel/aws-databricks/intel/latest)

* **See examples folder and README for each examples above to use this module**


Run Terraform

```hcl
terraform init  
terraform plan
terraform apply 
```
## Considerations
More Information regarding deploying Databricks Workspace [Databricks](https://registry.terraform.io/providers/databricks/databricks/latest/docs#authentication)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.31 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.48 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~> 1.14.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | ~> 1.14.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_cluster.dbx_cluster](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/cluster) | resource |
| [databricks_token.pat](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/token) | resource |
| [databricks_spark_version.latest_lts](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/spark_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_dbx_node_type_id"></a> [aws\_dbx\_node\_type\_id](#input\_aws\_dbx\_node\_type\_id) | The type of the AWS Compute Machine that are supported by databricks. | `string` | `"i4i.2xlarge"` | no |
| <a name="input_azure_dbx_node_type_id"></a> [azure\_dbx\_node\_type\_id](#input\_azure\_dbx\_node\_type\_id) | The type of the Azure Compute Machine that are supported by databricks. | `string` | `"Standard_E8ds_v5"` | no |
| <a name="input_dbx_auto_terminate_min"></a> [dbx\_auto\_terminate\_min](#input\_dbx\_auto\_terminate\_min) | Automatically terminate the cluster after being inactive for this time in minutes. If specified, the threshold must be between 10 and 10000 minutes. You can also set this value to 0 to explicitly disable automatic termination. Defaults to 60. We highly recommend having this setting present for Interactive/BI clusters. | `number` | `120` | no |
| <a name="input_dbx_autoscale_max_workers"></a> [dbx\_autoscale\_max\_workers](#input\_dbx\_autoscale\_max\_workers) | The maximum number of workers to which the cluster can scale up when overloaded. max\_workers must be strictly greater than min\_workers. | `number` | `50` | no |
| <a name="input_dbx_autoscale_min_workers"></a> [dbx\_autoscale\_min\_workers](#input\_dbx\_autoscale\_min\_workers) | The minimum number of workers to which the cluster can scale down when underutilized. It is also the initial number of workers the cluster will have after creation. | `number` | `1` | no |
| <a name="input_dbx_cloud"></a> [dbx\_cloud](#input\_dbx\_cloud) | Flag that decides which Cloud to use for the instance type in Databricks Cluster | `string` | n/a | yes |
| <a name="input_dbx_cluster_name"></a> [dbx\_cluster\_name](#input\_dbx\_cluster\_name) | Cluster name, which doesn’t have to be unique. If not specified at creation, the cluster name will be an empty string. | `string` | `"dbx_optimized_cluster"` | no |
| <a name="input_dbx_host"></a> [dbx\_host](#input\_dbx\_host) | Required URL for the databricks workspace | `string` | n/a | yes |
| <a name="input_dbx_runtime_engine"></a> [dbx\_runtime\_engine](#input\_dbx\_runtime\_engine) | The type of runtime engine to use. If not specified, the runtime engine type is inferred based on the spark\_version value. Allowed values include: PHOTON, STANDARD. | `string` | `"PHOTON"` | no |
| <a name="input_dbx_spark_config"></a> [dbx\_spark\_config](#input\_dbx\_spark\_config) | Key - Value pair for Intel Optimizations for Spark configuration | `map(string)` | <pre>{<br/>  "spark.databricks.adaptive.autoOptimizeShuffle.enabled": "true",<br/>  "spark.databricks.delta.preview.enabled": "true",<br/>  "spark.databricks.io.cache.enabled": "true",<br/>  "spark.databricks.io.cache.maxDiskUsage": "100g",<br/>  "spark.databricks.io.cache.maxMetaDataCache": "10g",<br/>  "spark.databricks.passthrough.enabled": "true"<br/>}</pre> | no |
| <a name="input_enable_intel_tags"></a> [enable\_intel\_tags](#input\_enable\_intel\_tags) | If true adds additional Intel tags to resources | `bool` | `true` | no |
| <a name="input_intel_tags"></a> [intel\_tags](#input\_intel\_tags) | Intel Tags | `map(string)` | <pre>{<br/>  "intel-module": "terraform-intel-databricks-cluster",<br/>  "intel-registry": "https://registry.terraform.io/namespaces/intel"<br/>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | <pre>{<br/>  "key": "value"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dbx_cluster_autoterminate_min"></a> [dbx\_cluster\_autoterminate\_min](#output\_dbx\_cluster\_autoterminate\_min) | Autoterminate minute of the databricks cluster |
| <a name="output_dbx_cluster_custom_tags"></a> [dbx\_cluster\_custom\_tags](#output\_dbx\_cluster\_custom\_tags) | Custom Tags |
| <a name="output_dbx_cluster_name"></a> [dbx\_cluster\_name](#output\_dbx\_cluster\_name) | Name of the databricks cluster |
| <a name="output_dbx_cluster_node_type_id"></a> [dbx\_cluster\_node\_type\_id](#output\_dbx\_cluster\_node\_type\_id) | Instance type of the databricks cluster |
| <a name="output_dbx_cluster_runtime_engine"></a> [dbx\_cluster\_runtime\_engine](#output\_dbx\_cluster\_runtime\_engine) | Runtime Engine of the databricks cluster |
| <a name="output_dbx_cluster_spark_conf"></a> [dbx\_cluster\_spark\_conf](#output\_dbx\_cluster\_spark\_conf) | Spark Configurations of the databricks cluster |
| <a name="output_dbx_cluster_spark_version"></a> [dbx\_cluster\_spark\_version](#output\_dbx\_cluster\_spark\_version) | Spark version of the databricks cluster |
| <a name="output_dbx_pat"></a> [dbx\_pat](#output\_dbx\_pat) | Personal Access Token |

## Links

<https://aws.amazon.com/ec2/instance-types/i4i/>
<https://www.databricks.com/blog/2022/09/13/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake>
<https://www.databricks.com/product/pricing>
<https://learn.microsoft.com/en-us/azure/virtual-machines/edv5-edsv5-series>
<https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html>

<!-- END_TF_DOCS -->