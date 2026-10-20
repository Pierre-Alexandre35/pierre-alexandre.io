provider "google" {
  project = var.project_id
}

resource "google_storage_bucket" "website" {
  project                     = var.project_id
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention    = "inherited"
  force_destroy               = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "error/404.html"
  }

  labels = {
    managed_by = "terraform"
    purpose    = "personal-website"
  }
}

resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
