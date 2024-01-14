terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.11.0"
    }
  }
  backend "gcs" {
    bucket  = "devops-challenge-tf"
    prefix  = "terraform/gke-cluster"
  }
  required_version = "v1.5.4"
}

provider "google" {
# credentials = file("path/to/your/credentials.json")
# For auth, simply use gcloud login

  project     = var.project_id
  region      = var.region
}
