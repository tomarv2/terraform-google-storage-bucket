terraform {
  required_version = ">= 1.0.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.12.0"
    }
  }
}

provider "google" {
  region  = var.region
  project = var.project
}

module "storage_bucket" {
  source = "../../"

  uniform_bucket_level_access = true
  versioning                  = false
  enable_website              = true  # NOTE: enable_website and enable_cors go togeather
  enable_cors                 = false # enable_cors is dependent on enable_website
  # -----------------------------------
  teamid = var.teamid
  prjid  = var.prjid
}
