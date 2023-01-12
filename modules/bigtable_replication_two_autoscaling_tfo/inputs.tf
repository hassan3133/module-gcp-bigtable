variable "clusterid" {
  description = "An alphabetic character representing the clusterid."
  type        = string
}

variable "cpu_target" {
  description = "The CPU utilization target in percentage. Must be between 10 and 80."
  type        = number
}

variable "custom_instance_name" {
  description = "Override default naming shceme."
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Deletion_protection."
  type        = bool
  default     = true
}

variable "env" {
  description = "The environment."
  type        = string
}

variable "instanceid" {
  description = "An alphabetic character representing the instance."
  type        = number
  default     = 0
}

variable "labels" {
  description = "Labels."
  type        = map
  default     = {}
}

variable "max_nodes" {
  description = "The maximum number of nodes for autoscaling."
  type        = number
}

variable "min_nodes" {
  description = "The minimum number of nodes for autoscaling."
  type        = number
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "region" {
  description = "Google cloud platform region."
  type        = string
}

variable "rep_region" {
  description = "Region in which you want the master instance located (FULL NAME OF LOCATION)."
  type        = string
  default     = ""
}

variable "rep_zone_offset" {
  description = "Set the starting zone."
  type        = number
  default     = 0
}

variable "servertype" {
  description = "A priceline server type."
  type        = string
}

variable "storage_type" {
  description = "The storage type to use. One of 'SSD' or 'HDD'. Defaults to 'SSD'."
  type        = string
  default     = "SSD"
}

variable "team" {
  description = "Name of the team that owns the resource."
  type        = string
  default     = ""
}

variable "zone_offset" {
  description = "Set the starting zone."
  type        = number
  default     = 0
}
