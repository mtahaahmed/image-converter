resource "google_service_account" "example" {
  account_id   = "example-service-account"
  display_name = "Example Service Account"
}

resource "google_service_account_key" "example_key" {
  service_account_id = google_service_account.example.name
}

# Grant Cloud Pub/Sub permissions
resource "google_project_iam_binding" "pubsub_binding" {
  project = "your-gcp-project-id"
  role    = "roles/pubsub.editor"
  members = [
    "serviceAccount:${google_service_account.example.email}",
  ]
}

# Grant Cloud SQL permissions
resource "google_project_iam_binding" "sql_binding" {
  project = "your-gcp-project-id"
  role    = "roles/cloudsql.client"
  members = [
    "serviceAccount:${google_service_account.example.email}",
  ]
}

# Grant Cloud Storage permissions
resource "google_project_iam_binding" "storage_binding" {
  project = "your-gcp-project-id"
  role    = "roles/storage.objectAdmin"
  members = [
    "serviceAccount:${google_service_account.example.email}",
  ]
}

# Grant EventArc permissions
resource "google_project_iam_binding" "eventarc_binding" {
  project = "your-gcp-project-id"
  role    = "roles/eventarc.admin"
  members = [
    "serviceAccount:${google_service_account.example.email}",
  ]
}
