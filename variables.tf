variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "multi_region" {
  description = "Location where this resources should be created"
  type        = string
  default     = null
}

variable "uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access access to a bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  type        = bool
  default     = false
}

variable "versioning" {
  description = "Versioning should be enabled or disabled on bucket"
  type        = bool
  default     = false
}

variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "encryption" {
  description = "A Cloud KMS key that will be used to encrypt objects inserted into this bucket"
  type = object({
    default_kms_key_name = string
  })
  default = null
}

variable "index_page" {
  description = "Bucket's directory index"
  type        = string
  default     = "index.html"
}

variable "not_found_page" {
  description = "The custom object to return when a requested resource is not found"
  type        = string
  default     = "404.html"
}

variable "enable_cors" {
  description = "Set to true if you want to enable CORS headers"
  type        = bool
  default     = false
}

variable "cors_origins" {
  description = "List of Origins eligible to receive CORS response headers. Note: '*' is permitted in the list of origins, and means 'any Origin'"
  type        = list(string)
  default     = []
}

variable "cors_methods" {
  description = "list of HTTP methods on which to include CORS response headers, (GET, OPTIONS, POST, etc). Note: '*' is permitted in the list of methods, and means 'any method'"
  type        = list(string)
  default     = []
}

variable "cors_extra_headers" {
  description = "List of HTTP headers other than the simple response headers to give permission for the user-agent to share across domains"
  type        = list(string)
  default     = []
}

variable "cors_max_age_seconds" {
  description = "The value, in seconds, to return in the Access-Control-Max-Age header used in preflight responses"
  type        = number
  default     = 600
}

variable "enable_website" {
  description = "Set to true if you want to enable CORS headers"
  type        = bool
  default     = false
}

variable "deploy_bucket" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "bucket_name" {
  description = "Google storage bucket name"
  type        = string
  default     = null
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 3
}

locals {
  suffix = random_string.naming.result
}

variable "custom_labels" {
  type        = any
  description = "Extra custom labels"
  default     = null
}
