output "bucket_name" {
  description = "Bucket receiving the static website files."
  value       = google_storage_bucket.website.name
}

output "bucket_uri" {
  description = "Cloud Storage destination for uploads."
  value       = "gs://${google_storage_bucket.website.name}"
}

output "index_url" {
  description = "Direct HTTPS object URL for checking the uploaded index; not a custom-domain website endpoint."
  value       = "https://storage.googleapis.com/${google_storage_bucket.website.name}/index.html"
}
