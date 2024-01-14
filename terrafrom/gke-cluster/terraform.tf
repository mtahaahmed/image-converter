terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.11.0"
    }
  }
}

provider "google" {
# credentials = file("path/to/your/credentials.json")
# For auth, simply use gcloud login

  project     = var.project_id
  region      = var.region
}
