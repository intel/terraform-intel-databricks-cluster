<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module
## Policy 1

Description: Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake) should be used. 

```
If dbx_cloud = 'aws' then use Storage Optimized .
If dbx_cloud = 'azure' then use Memory Optimized.
```

Resource type: databricks_cluster

Parameter: node_type_id

Allowed Types

- **Storage Optimized for AWS:** i4i.large, i4i.xlarge, i4i.2xlarge, i4i.4xlarge, i4i.8xlarge, i4i.16xlarge, i4i.32xlarge
- **Memory Optimized for Azure:** Standard_E4ds_v5, Standard_E8ds_v5, Standard_E16ds_v5, Standard_E20ds_v5, Standard_E32ds_v5, Standard_E48ds_v5, Standard_E64ds_v5, Standard_E96ds_v5

## Policy 2  

Description: Provisioned PHOTON runtime engine should be used for enhanced performance

Resource type: databricks_cluster

Parameter: runtime_engine

Allowed Type: PHOTON

## Policy 3  

Description: databricks_cluster

Resource type: databricks_cluster

Parameter: spark_conf

Allowed Type: map(string) #(Cannot be null)

## Links

<https://aws.amazon.com/ec2/instance-types/i4i/>

<https://www.databricks.com/blog/2022/09/13/faster-insights-databricks-photon-using-aws-i4i-instances-latest-intel-ice-lake>

<https://www.databricks.com/product/pricing>

<https://learn.microsoft.com/en-us/azure/virtual-machines/edv5-edsv5-series>

<https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html>

