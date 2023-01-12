#----------------------------------------------------------------------------
# bigtable replication
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# local variables
#----------------------------------------------------------------------------

locals {

  datacenter     = "${module.gcp_varlib.region_to_datacenter[var.region]}"
  rep_datacenter = "${module.gcp_varlib.region_to_datacenter[var.rep_region]}"

  name_prefix     = "${local.datacenter}-${var.servertype}-${module.gcp_varlib.env_to_singlechar[var.env]}${var.clusterid}"
  rep_name_prefix = "${local.rep_datacenter}-${var.servertype}-${module.gcp_varlib.env_to_singlechar[var.env]}${var.clusterid}"

  # DEVELOPMENT has one cluster, PRODUCTION has cluster_count clusters
  cluster_limit     = var.instance_type == "DEVELOPMENT" ? 1 : var.cluster_count
  rep_cluster_limit = var.cluster_count

  #  full_cluster_list = flatten([
  #      for val in var.cluster_count: [
  #        "node-${val}" = {
  #          "cluster_id" = "${local.name_prefix}${format("%02d", val + 1)}",
  #          "zone"       =  data.google_compute_zones.available.names[val]
  #        }
  #      ]
  #  ])


  #  clusters = [
  #    "${local.name_prefix}${format("%02d", c + 1)}",
  #    "${local.rep_name_prefix}${format("%02d", c + 1)}"
  #  ]
  #
  #  full_cluster_list = flatten([
  #    for c in range(, var.cluster_count) : {
  #      for n in local.clusters: [
  #        cluster_id   = "${local.name_prefix}${format("%02d", c + 1)}"
  #        zone         = data.google_compute_zones.available.names[c]
  #      ]
  #    }
  #  ])

  #  full_cluster_list = flatten([
  #    for c in range(0, var.cluster_count) : {
  #      "master" = {
  #        cluster_id   = "${local.name_prefix}${format("%02d", c + 1)}"
  #        zone         = data.google_compute_zones.available.names[c]
  #      }
  #      "replicate" = {
  #        cluster_id   = "${local.rep_name_prefix}${format("%02d", c + 1)}"
  #        zone         = data.google_compute_zones.rep_available.names[c]
  #      }
  #    }
  #  ])
  #
  #}

  master_cluster_list = [
    for c in range(0, var.cluster_count) :
    {
      cluster_id = "${local.name_prefix}${format("%02d", c + 1)}"
      zone       = data.google_compute_zones.available.names[c + var.zone_offset]
    }
  ]

  replica_cluster_list = [
    for c in range(0, var.cluster_count) :
    {
      cluster_id = "${local.rep_name_prefix}${format("%02d", c + 1)}"
      zone       = data.google_compute_zones.rep_available.names[c + var.zone_offset]
    }
  ]

}

#----------------------------------------------------------------------------
# data requests
#----------------------------------------------------------------------------

# data.google_compute_zones.available
data "google_compute_zones" "available" {
  region  = var.region
  project = var.project
}

data "google_compute_zones" "rep_available" {
  region  = var.rep_region
  project = var.project
}

#----------------------------------------------------------------------------
# resource creation
#----------------------------------------------------------------------------



resource "google_bigtable_instance" "default" {
  name          = var.custom_instance_name != "" ? var.custom_instance_name : "${var.servertype}-${format("%02d", var.instanceid)}"
  instance_type = var.instance_type

  dynamic "cluster" {
    for_each = concat(local.master_cluster_list, local.replica_cluster_list)

    content {
      cluster_id   = cluster.value.cluster_id
      zone         = cluster.value.zone
      num_nodes    = var.instance_type == "DEVELOPMENT" ? null : var.num_nodes
      storage_type = var.storage_type
    }
  }
}
