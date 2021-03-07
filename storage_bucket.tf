resource "google_storage_bucket" "bucket" {
  name                        = "${var.teamid}-${var.prjid}"
  location                    = var.gcp_region
  force_destroy               = var.force_destroy
  project                     = var.gcp_project
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels                      = merge(local.shared_labels)

  //  versioning {
  //    enabled = lookup(
  //      var.versioning,
  //      lower(each.value),
  //      false,
  //    )
  //  }
  //  dynamic "website" {
  //    for_each = lookup(var.website, each.value, {}) != {} ? { v = lookup(var.website, each.value) } : {}
  //    content {
  //      main_page_suffix = lookup(website.value, "main_page_suffix", null)
  //      not_found_page   = lookup(website.value, "not_found_page", null)
  //    }
  //  }
}