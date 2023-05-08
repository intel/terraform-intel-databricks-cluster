<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-databricks/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Intel Optimized Databricks Cluster

The module can deploy an Intel Optimized Databricks Cluster. Instance Selection and Intel Optimizations have been defaulted in the code.

**Learn more about AWS optimizations :**

[Databricks Photon using AWS i4i](https://www.databricks.com/blog/2022/09/13/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake)

[Databricks Photon using Azure Edsv5](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

[Accelerating Databricks Runtime for Machine Learning](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273)



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