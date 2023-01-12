![Maintained by Priceline.com](https://img.shields.io/badge/maintained%20by-priceline.com-blue)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg)

```
module "test_replication_two_autoscaling" {
  source = "git::https://github.com/pcln/terraform-gcp-bigtable.git//modules/bigtable_replication_two_autoscaling_tfo"

  instanceid    = 0
  clusterid     = ""
  min_nodes     = 1
  max_nodes     = 2
  cpu_target    = 50

  servertype = "test"

  env        = "poc"
  project    = "pcln-pl-devops-poc"
  region     = "us-east4"
  rep_region = "northamerica-northeast1"
}
```

<!-- BEGIN_TF_DOCS -->
#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudcost_labels"></a> [cloudcost_labels](#module_cloudcost_labels) | git::https://github.com/pcln/terraform-curl-cloudcost_labels.git//modules/cloudcost_labels | n/a |
| <a name="module_gcp_varlib"></a> [gcp_varlib](#module_gcp_varlib) | git::https://github.com/pcln/terraform-gcp-varlib.git//modules/gcp_varlib | n/a |

#### Resources

| Name | Type |
|------|------|
| [google_bigtable_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clusterid"></a> [clusterid](#input_clusterid) | An alphabetic character representing the clusterid. | `string` | n/a | yes |
| <a name="input_cpu_target"></a> [cpu_target](#input_cpu_target) | The CPU utilization target in percentage. Must be between 10 and 80. | `number` | n/a | yes |
| <a name="input_env"></a> [env](#input_env) | The environment. | `string` | n/a | yes |
| <a name="input_max_nodes"></a> [max_nodes](#input_max_nodes) | The maximum number of nodes for autoscaling. | `number` | n/a | yes |
| <a name="input_min_nodes"></a> [min_nodes](#input_min_nodes) | The minimum number of nodes for autoscaling. | `number` | n/a | yes |
| <a name="input_project"></a> [project](#input_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input_region) | Google cloud platform region. | `string` | n/a | yes |
| <a name="input_servertype"></a> [servertype](#input_servertype) | A priceline server type. | `string` | n/a | yes |
| <a name="input_custom_instance_name"></a> [custom_instance_name](#input_custom_instance_name) | Override default naming shceme. | `string` | `""` | no |
| <a name="input_deletion_protection"></a> [deletion_protection](#input_deletion_protection) | Deletion_protection. | `bool` | `true` | no |
| <a name="input_instanceid"></a> [instanceid](#input_instanceid) | An alphabetic character representing the instance. | `number` | `0` | no |
| <a name="input_labels"></a> [labels](#input_labels) | Labels. | `map` | `{}` | no |
| <a name="input_rep_region"></a> [rep_region](#input_rep_region) | Region in which you want the master instance located (FULL NAME OF LOCATION). | `string` | `""` | no |
| <a name="input_rep_zone_offset"></a> [rep_zone_offset](#input_rep_zone_offset) | Set the starting zone. | `number` | `0` | no |
| <a name="input_storage_type"></a> [storage_type](#input_storage_type) | The storage type to use. One of 'SSD' or 'HDD'. Defaults to 'SSD'. | `string` | `"SSD"` | no |
| <a name="input_team"></a> [team](#input_team) | Name of the team that owns the resource. | `string` | `""` | no |
| <a name="input_zone_offset"></a> [zone_offset](#input_zone_offset) | Set the starting zone. | `number` | `0` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ids"></a> [cluster_ids](#output_cluster_ids) | List of cluster ids in instance. |
| <a name="output_instance_name"></a> [instance_name](#output_instance_name) | The bigtable instance name. |
<!-- END_TF_DOCS -->
