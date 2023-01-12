#----------------------------------------------------------------------------
# outputs - module outputs
#----------------------------------------------------------------------------

output "instance_name" {
  description = "the bigtable instance name"
  value       = var.instance_name
}

output "cluster_ids" {
  description = "list of cluster ids in instance"
  value       = google_bigtable_instance.default.cluster[*].cluster_id
}
