#----------------------------------------------------------------------------
# bigtable
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# local variables
#----------------------------------------------------------------------------

locals {
  datacenter = module.gcp_varlib.region_to_datacenter[var.region]

  name_prefix = "${local.datacenter}-${var.servertype}-${module.gcp_varlib.env_to_singlechar[var.env]}${var.instanceid}"

  # DEVELOPMENT has one cluster, PRODUCTION has cluster_count clusters
  cluster_limit = var.instance_type == "DEVELOPMENT" ? 1 : var.cluster_count
}

#----------------------------------------------------------------------------
# data requests
#----------------------------------------------------------------------------

# data.google_compute_zones.available
data "google_compute_zones" "available" {
  region  = var.region
  project = var.project
}

#----------------------------------------------------------------------------
# resource creation
#----------------------------------------------------------------------------

resource "google_bigtable_instance" "default" {
  name          = local.name_prefix
  instance_type = var.instance_type

  dynamic "cluster" {
    # DEVELOPMENT has one cluster, PRODUCTION has cluster_count clusters
    for_each = range(0, local.cluster_limit)

    content {
      # guse4-servertype-001 where 0 is instanceid and 01 is sequence
      cluster_id   = "${local.name_prefix}${format("%02d", cluster.value + 1)}"
      zone         = data.google_compute_zones.available.names[cluster.value]
      num_nodes    = var.instance_type == "DEVELOPMENT" ? null : var.num_nodes
      storage_type = var.storage_type
    }
  }
}
