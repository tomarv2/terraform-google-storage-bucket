output "storage_bucket_name" {
  description = "Storage bucket name"
  value       = google_storage_bucket.bucket.name
}

output "storage_bucket_url" {
  description = "Storage bucket url"
  value       = google_storage_bucket.bucket.url
}

output "storage_bucket_id" {
  description = "Storage bucket id"
  value       = google_storage_bucket.bucket.id
}

output "storage_bucket_location" {
  description = "Storage bucket location"
  value       = google_storage_bucket.bucket.location
}
