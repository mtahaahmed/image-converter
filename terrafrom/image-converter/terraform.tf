terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0, < 3.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0, < 3.0.0"
    }
  }
  backend "gcs" {
    bucket  = "devops-challenge-tf"
    prefix  = "terraform/image-conveter"
  }
  required_version = "v1.5.4"
}

provider "google" {
# credentials = file("path/to/your/credentials.json")
# For auth, simply use gcloud login

  project     = var.project_id
  region      = var.region
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.current.endpoint}"
  token = data.google_client_config.terraform_config.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.current.master_auth[0].cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.current.endpoint}"
    token                  = data.google_client_config.terraform_config.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.current.master_auth[0].cluster_ca_certificate)
  }
}
