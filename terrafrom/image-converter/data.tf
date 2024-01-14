# data "google_service_account_access_token" "current" {
#   target_service_account = "wif-gke-access@${var.project_id}.iam.gserviceaccount.com"
#   scopes                 = ["userinfo-email", "cloud-platform"]
# }

data "google_client_config" "terraform_config" {
  provider = google
}

data "google_container_cluster" "current" {
  project  = var.project_id
  location = "${var.region}-a"
  name     = var.cluster_name
}