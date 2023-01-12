#----------------------------------------------------------------------------
# inputs - module parameters
#----------------------------------------------------------------------------
variable "cluster_count" {
  description = "Number of clusters. Only valid for PRODUCTION instances_types"
  type        = number
  default     = 1
}

variable "env" {
  description = "the environment"
  type        = string
}

variable "instanceid" {
  description = "an alphabetic character representing the instance"
  type        = number
  default     = 0
}

variable "clusterid" {
  description = "an alphabetic character representing the clusterid"
  type        = string
}

variable "instance_type" {
  description = "The instance type to create. One of 'DEVELOPMENT' or 'PRODUCTION'. Defaults to 'PRODUCTION'"
  type        = string
  default     = "PRODUCTION"
}

variable "num_nodes" {
  description = "integer for the number of resources to create for PRODUCTION instances_types ONLY"
  type        = number
  default     = 3
}

variable "region" {
  description = "a google cloud platform region"
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "servertype" {
  description = "a priceline server type"
  type        = string
}

variable "storage_type" {
  description = "The storage type to use. One of 'SSD' or 'HDD'. Defaults to 'SSD'"
  type        = string
  default     = "SSD"
}

variable "rep_region" {
  description = "Region in which you want the master instance located (FULL NAME OF LOCATION)"
  type        = string
  default     = ""
}

variable "custom_instance_name" {
  description = "Override default naming shceme"
  type        = string
  default     = ""
}

variable "zone_offset" {
  description = "set the starting zone"
  type        = number
  default     = 0
}

variable "rep_zone_offset" {
  description = "set the starting zone"
  type        = number
  default     = 0
}

variable "team" {
  description = "Name of the team that owns the resource"
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "deletion_protection"
  type        = bool
  default     = true
}

variable "labels" {
  description = "labels"
  type        = map
  default     = {}
}

