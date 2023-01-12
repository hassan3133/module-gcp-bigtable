![Maintained by Priceline.com](https://img.shields.io/badge/maintained%20by-priceline.com-blue)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.12.0-blue.svg)

# [Single bigtable Instance with multiple configurations]
# [single node in single zone]
```
module "bigtable_advanced_test" {
  source = "git::https://github.com/pcln/terraform-gcp-bigtable.git//modules/bigtable_replication_advanced_tfo?ref=advanced_replication"

  instance_name        = "bigtable-adv"

  clusters = {
    "test1" = {
      server_type  = "test-01",
      region       = "us-east4",
      zone         = "a",
      storage_type = "SSD"
      num_nodes    = "1"
    }
  }

  env     = "poc"
  project = "pcln-pl-devops-poc"
  region  = "us-east4"
}
```

# [Multiple clusters same region different zones]
```
module "bigtable_advanced_test" {
  source = "git::https://github.com/pcln/terraform-gcp-bigtable.git//modules/bigtable_replication_advanced_tfo?ref=advanced_replication"

  instance_name        = "bigtable-adv_rep"

  clusters = {
    "test1" = {
      server_type  = "test-01",
      region       = "us-east4",
      zone         = "a",
      storage_type = "SSD"
      num_nodes    = "1"
    },
    "test2" = {
      server_type  = "test-02",
      region       = "us-east4",
      zone         = "b",
      storage_type = "SSD"
      num_nodes    = "1"
    }
  }

  env     = "poc"
  project = "pcln-pl-devops-poc"
  region  = "us-east4"
}
```

# [Multiple clusters different region different zones]
```
module "bigtable_advanced_test" {
  source = "git::https://github.com/pcln/terraform-gcp-bigtable.git//modules/bigtable_replication_advanced_tfo?ref=advanced_replication"

  instance_name        = "bigtable-adv_rep"

  clusters = {
    "test1" = {
      server_type  = "test-01",
      region       = "us-east4",
      zone         = "a",
      storage_type = "SSD"
      num_nodes    = "1"
    },
    "test2" = {
      server_type  = "test-02",
      region       = "northamerica-northeast1"
      zone         = "a",
      storage_type = "SSD"
      num_nodes    = "1"
    }
  }

  env     = "poc"
  project = "pcln-pl-devops-poc"
  region  = "us-east4"
}
```

<!-- BEGIN_TF_DOCS -->
#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudcost_labels"></a> [cloudcost_labels](#module_cloudcost_labels) | git::https://github.com/pcln/terraform-curl-cloudcost_labels.git//modules/cloudcost_labels |  |
| <a name="module_gcp_varlib"></a> [gcp_varlib](#module_gcp_varlib) | git::https://github.com/pcln/terraform-gcp-varlib.git//modules/gcp_varlib |  |

#### Resources

| Name | Type |
|------|------|
| [google_bigtable_instance.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clusters"></a> [clusters](#input_clusters) | map of data nodes | <pre>map(object({<br>    server_type  = string,<br>    region       = string,<br>    zone         = string,<br>    num_nodes    = number,<br>    storage_type = string,<br>  }))</pre> | n/a | yes |
| <a name="input_env"></a> [env](#input_env) | the environment | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance_name](#input_instance_name) | Name of bigtable instance | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input_project) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input_region) | a google cloud platform region | `string` | n/a | yes |
| <a name="input_instanceid"></a> [instanceid](#input_instanceid) | an alphabetic character representing the instance | `number` | `0` | no |
| <a name="input_team"></a> [team](#input_team) | Name of the team that owns the bigtable advanced | `string` | `""` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ids"></a> [cluster_ids](#output_cluster_ids) | list of cluster ids in instance |
| <a name="output_instance_name"></a> [instance_name](#output_instance_name) | the bigtable instance name |
<!-- END_TF_DOCS -->
