output "storage_bucket_name" {
  description = "Storage bucket name"
  value       = join(" ", google_storage_bucket.bucket.*.name)
}

output "storage_bucket_url" {
  description = "Storage bucket url"
  value       = join(" ", google_storage_bucket.bucket.*.url)
}

output "storage_bucket_id" {
  description = "Storage bucket id"
  value       = join(" ", google_storage_bucket.bucket.*.id)
}

output "storage_bucket_location" {
  description = "Storage bucket location"
  value       = join(" ", google_storage_bucket.bucket.*.location)
}

output "storage_bucket_storage_class" {
  description = "Storage bucket class"
  value       = join(" ", google_storage_bucket.bucket.*.storage_class)
}

output "storage_bucket_website" {
  description = "URL of the website"
  value       = google_storage_bucket.bucket.*.website
}
