resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "EU"

  uniform_bucket_level_access = true
}