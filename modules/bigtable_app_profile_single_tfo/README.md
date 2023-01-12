<!-- BEGIN_TF_DOCS -->
#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp_varlib"></a> [gcp_varlib](#module_gcp_varlib) | git::https://github.com/pcln/terraform-gcp-varlib.git//modules/gcp_varlib |  |

#### Resources

| Name | Type |
|------|------|
| [google_bigtable_app_profile.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_app_profile) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_profile_id"></a> [app_profile_id](#input_app_profile_id) | The unique name of the app profile in the form [_a-zA-Z0-9][-_.a-zA-Z0-9]* | `string` | n/a | yes |
| <a name="input_cluster_id"></a> [cluster_id](#input_cluster_id) | The ID of the Cloud Bigtable cluster. | `string` | n/a | yes |
| <a name="input_instance"></a> [instance](#input_instance) | The name of the instance to create the app profile within. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_allow_transactional_writes"></a> [allow_transactional_writes](#input_allow_transactional_writes) | If true, CheckAndMutateRow and ReadModifyWriteRow requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input_description) | Long form description of the use case for this app profile | `string` | `null` | no |
| <a name="input_ignore_warnings"></a> [ignore_warnings](#input_ignore_warnings) | If true, ignore safety checks when deleting/updating the app profile. | `bool` | `null` | no |

#### Outputs

No outputs.
<!-- END_TF_DOCS -->
