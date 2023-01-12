variable "clusters" {
  type = map(object({
    server_type  = string,
    region       = string,
    zone         = string,
    storage_type = string,
    min_nodes    = number,
    max_nodes    = number,
    cpu_target   = number,
  }))
  description = "Map of data nodes."
}

variable "deletion_protection" {
  description = "Deletion_protection."
  type        = bool
  default     = true
}

variable "instance_name" {
  description = "Name of bigtable instance."
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "team" {
  description = "Name of the team that owns the bigtable advanced."
  type        = string
  default     = ""
}
