output "cluster_ids" {
  description = "List of cluster ids in instance."
  value       = google_bigtable_instance.default.cluster[*].cluster_id
}

output "instance_name" {
  description = "The bigtable instance name."
  value       = var.instance_name
}
