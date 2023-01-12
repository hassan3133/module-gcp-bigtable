#----------------------------------------------------------------------------
# bigtable replication
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# local variables
#----------------------------------------------------------------------------

locals {
  default_labels = { managed_by = "terraform" }
}

#----------------------------------------------------------------------------
# resource creation
#----------------------------------------------------------------------------

resource "google_bigtable_instance" "default" {
  name   = var.instance_name
  labels = merge(local.default_labels, module.cloudcost_labels.labels)
  dynamic "cluster" {
    for_each = [for c in var.clusters : {
      cluster_id   = "${module.gcp_varlib.region_to_datacenter[c.region]}-${c.server_type}"
      zone         = "${c.region}-${c.zone}"
      num_nodes    = c.num_nodes
      storage_type = c.storage_type
    }]

    content {
      cluster_id   = cluster.value.cluster_id
      zone         = cluster.value.zone
      num_nodes    = cluster.value.num_nodes
      storage_type = cluster.value.storage_type
    }
  }

}
