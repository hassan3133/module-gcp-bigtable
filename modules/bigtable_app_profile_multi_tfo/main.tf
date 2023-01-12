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
  description    = var.description != null ? var.description : "${var.instance} multi_cluster"

  multi_cluster_routing_use_any = true
  ignore_warnings               = var.ignore_warnings

  # pass through
  project = var.project
}
