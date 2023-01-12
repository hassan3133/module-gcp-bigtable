#----------------------------------------------------------------------------
# bigtable_app_profile
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# local variables
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# data requests
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# resource creation
#----------------------------------------------------------------------------

resource "google_bigtable_app_profile" "default" {
  app_profile_id = var.app_profile_id
  instance       = var.instance
  description    = var.description != null ? var.description : "${var.instance} single_cluster"

  single_cluster_routing {
    cluster_id                 = var.cluster_id
    allow_transactional_writes = var.allow_transactional_writes
  }

  ignore_warnings = var.ignore_warnings

  # pass through
  project = var.project
}
