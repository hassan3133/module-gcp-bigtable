<!-- BEGIN_TF_DOCS -->
#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp_varlib"></a> [gcp_varlib](#module_gcp_varlib) | git::https://github.com/pcln/terraform-gcp-varlib.git//modules/gcp_varlib |  |

#### Resources

| Name | Type |
|------|------|
| [google_bigtable_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input_env) | the environment | `string` | n/a | yes |
| <a name="input_instanceid"></a> [instanceid](#input_instanceid) | an alphabetic character representing the instance | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input_region) | a google cloud platform region | `string` | n/a | yes |
| <a name="input_servertype"></a> [servertype](#input_servertype) | a priceline server type | `string` | n/a | yes |
| <a name="input_cluster_count"></a> [cluster_count](#input_cluster_count) | Number of clusters. Only valid for PRODUCTION instances_types | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | The instance type to create. One of 'DEVELOPMENT' or 'PRODUCTION'. Defaults to 'PRODUCTION' | `string` | `"PRODUCTION"` | no |
| <a name="input_num_nodes"></a> [num_nodes](#input_num_nodes) | integer for the number of resources to create for PRODUCTION instances_types ONLY | `number` | `3` | no |
| <a name="input_storage_type"></a> [storage_type](#input_storage_type) | The storage type to use. One of 'SSD' or 'HDD'. Defaults to 'SSD' | `string` | `"SSD"` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ids"></a> [cluster_ids](#output_cluster_ids) | list of cluster ids in instance |
| <a name="output_instance_name"></a> [instance_name](#output_instance_name) | the bigtable instance name |
<!-- END_TF_DOCS -->
