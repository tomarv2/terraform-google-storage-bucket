output "storage_bucket_name" {
  description = "Storage bucket name"
  value       = module.storage_bucket.storage_bucket_name
}

output "storage_bucket_url" {
  description = "Storage bucket url"
  value       = module.storage_bucket.storage_bucket_url
}

output "storage_bucket_id" {
  description = "Storage bucket id"
  value       = module.storage_bucket.storage_bucket_id
}

output "storage_bucket_location" {
  description = "Storage bucket location"
  value       = module.storage_bucket.storage_bucket_location
}
