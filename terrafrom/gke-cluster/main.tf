resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}

# Create GKE cluster
resource "google_container_cluster" "gke" {
  name                     = var.cluster_name
  project                  = var.project_id
  location                 = "${var.region}-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  min_master_version       = local.version
  networking_mode          = "VPC_NATIVE"
  deletion_protection      = false

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
}

# Create additional-node-pool
resource "google_container_node_pool" "additional" {
  name     = "${var.cluster_name}-node-pool"
  location = var.region
  project  = var.project_id
  cluster  = google_container_cluster.gke.id

  node_count = 2
  version    = local.version

  node_config {
    preemptible  = true
    machine_type = "t2a-standard-1"
    image_type   = "COS_CONTAINERD"
    oauth_scopes = local.node_pools_oauth_scopes
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
