variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "gcp_project" {
  description = "Name of the GCP project"
}

variable "gcp_region" {
  default = "us-central1"
}

variable "uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access access to a bucket."
  default     = false
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default     = false
}

//variable "versioning" {
//  description = "Optional map of lowercase unprefixed name => boolean, defaults to false."
//  type        = map
//  default     = {}
//}
//
//variable "website" {
//  type        = any
//  default     = {}
//  description = "Map of website values. Supported attributes: main_page_suffix, not_found_page"
//}
