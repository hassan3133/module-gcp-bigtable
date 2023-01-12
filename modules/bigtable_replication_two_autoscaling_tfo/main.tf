#----------------------------------------------------------------------------
# bigtable replication
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# data requests
#----------------------------------------------------------------------------

data "google_compute_zones" "available" {
  for_each = local.regions_list

  region  = each.value
  project = var.project
}

#----------------------------------------------------------------------------
# local variables
#----------------------------------------------------------------------------

locals {
  regions_list = toset([var.region, var.rep_region])

  default_labels = { managed_by = "terraform" }

  name_prefix = "${var.servertype}-${module.gcp_varlib.env_to_singlechar[var.env]}${var.clusterid}"


  cluster_map = {
    (var.region) = {
      cluster_id = "${module.gcp_varlib.region_to_datacenter[var.region]}-${local.name_prefix}${format("%02d", 1)}"
      zone       = data.google_compute_zones.available[var.region].names[var.zone_offset]
    }
    (var.rep_region) = {
      cluster_id = "${module.gcp_varlib.region_to_datacenter[var.rep_region]}-${local.name_prefix}${format("%02d", 1)}"
      zone       = data.google_compute_zones.available[var.rep_region].names[var.rep_zone_offset]
    }
  }

}

#----------------------------------------------------------------------------
# resource creation
#----------------------------------------------------------------------------

resource "google_bigtable_instance" "default" {
  name                = var.custom_instance_name != "" ? var.custom_instance_name : "${var.servertype}-${format("%02d", var.instanceid)}"
  deletion_protection = var.deletion_protection


  labels = merge(local.default_labels, module.cloudcost_labels.labels, var.labels)
  dynamic "cluster" {
    for_each = local.cluster_map
    content {
      cluster_id   = cluster.value.cluster_id
      zone         = cluster.value.zone
      storage_type = var.storage_type
      kms_key_name = ""
      autoscaling_config {
        min_nodes  = var.min_nodes
        max_nodes  = var.max_nodes
        cpu_target = var.cpu_target
      }
    }
  }
  lifecycle {
    ignore_changes = [
      cluster.0.num_nodes,
      cluster.0.zone,
      cluster.1.num_nodes,
      cluster.1.zone,
    ]
  }
}
