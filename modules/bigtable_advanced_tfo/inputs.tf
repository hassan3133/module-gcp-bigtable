#----------------------------------------------------------------------------
# inputs - module parameters
#----------------------------------------------------------------------------

variable "clusters" {
  type = map(object({
    server_type  = string,
    region       = string,
    zone         = string,
    num_nodes    = number,
    storage_type = string,
  }))
  description = "map of data nodes"
}

variable "instance_name" {
  description = "Name of bigtable instance"
  type        = string
}

variable "instanceid" {
  description = "an alphabetic character representing the instance"
  type        = number
  default     = 0
}

###########################################################################

variable "env" {
  description = "the environment"
  type        = string
}

variable "region" {
  description = "a google cloud platform region"
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "team" {
  description = "Name of the team that owns the bigtable advanced"
  type        = string
  default     = ""
}
