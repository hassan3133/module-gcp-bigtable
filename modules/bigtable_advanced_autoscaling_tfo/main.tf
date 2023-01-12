locals {
  default_labels = { managed_by = "terraform" }
}

resource "google_bigtable_instance" "default" {
  name                = var.instance_name
  deletion_protection = var.deletion_protection
  labels              = merge(local.default_labels, module.cloudcost_labels.labels)
  dynamic "cluster" {
    for_each = [for c in var.clusters : {
      cluster_id   = "${module.gcp_varlib.region_to_datacenter[c.region]}-${c.server_type}"
      zone         = "${c.region}-${c.zone}"
      storage_type = c.storage_type
      min_nodes    = c.min_nodes
      max_nodes    = c.max_nodes
      cpu_target   = c.cpu_target
    }]

    content {
      cluster_id   = cluster.value.cluster_id
      zone         = cluster.value.zone
      storage_type = cluster.value.storage_type
      autoscaling_config {
        min_nodes  = cluster.value.min_nodes
        max_nodes  = cluster.value.max_nodes
        cpu_target = cluster.value.cpu_target
      }
    }
  }
  lifecycle {
    ignore_changes = [
      cluster.0.num_nodes,
      cluster.1.num_nodes,
    ]
  }
}
