#----------------------------------------------------------------------------
# inputs - module parameters
#----------------------------------------------------------------------------
variable "app_profile_id" {
  description = "The unique name of the app profile in the form [_a-zA-Z0-9][-_.a-zA-Z0-9]*"
  type        = string
}

variable "cluster_id" {
  description = "The ID of the Cloud Bigtable cluster."
  type        = string
}

variable "description" {
  description = "Long form description of the use case for this app profile"
  type        = string
  default     = null
}

variable "ignore_warnings" {
  description = "If true, ignore safety checks when deleting/updating the app profile."
  type        = bool
  default     = null
}

variable "instance" {
  description = "The name of the instance to create the app profile within."
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "allow_transactional_writes" {
  description = "If true, CheckAndMutateRow and ReadModifyWriteRow requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters."
  type        = bool
  default     = false
}
