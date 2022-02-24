module "storage_bucket" {
  source = "../../"

  gcp_project                 = "demo-1000"
  uniform_bucket_level_access = true
  versioning                  = false
  enable_website              = true  # NOTE: enable_website and enable_cors go togeather
  enable_cors                 = false # enable_cors is dependent on enable_website
  # -----------------------------------
  teamid = var.teamid
  prjid  = var.prjid
}