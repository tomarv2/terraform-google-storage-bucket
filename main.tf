resource "google_storage_bucket" "bucket" {

  count = var.deploy_bucket ? 1 : 0

  name                        = var.bucket_name != null ? var.bucket_name : "${var.teamid}-${var.prjid}-${local.suffix}"
  location                    = var.multi_region != null ? var.multi_region : var.gcp_region
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
  tags                        = var.custom_labels != null ? merge(var.custom_labels, local.shared_labels) : merge(local.shared_labels)

  versioning {
    enabled = var.versioning
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [var.retention_policy]
    content {
      is_locked        = var.retention_policy.is_locked
      retention_period = var.retention_policy.retention_period
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      default_kms_key_name = var.encryption.default_kms_key_name
    }
  }

  dynamic "website" {
    for_each = var.enable_website ? ["true"] : []
    content {
      main_page_suffix = var.index_page
      not_found_page   = var.not_found_page
    }
  }

  dynamic "cors" {
    for_each = var.enable_cors ? ["cors"] : []
    content {
      origin          = var.cors_origins
      method          = var.cors_methods
      response_header = var.cors_extra_headers
      max_age_seconds = var.cors_max_age_seconds
    }
  }
}
