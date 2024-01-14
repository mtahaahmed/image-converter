output "client_certificate" {
  value     = google_container_cluster.gke.master_auth[0].client_certificate
  sensitive = true
}

output "client_key" {
  value     = google_container_cluster.gke.master_auth[0].client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = google_container_cluster.gke.master_auth[0].cluster_ca_certificate
  sensitive = true
}

output "cluster_host" {
  value     = google_container_cluster.gke.endpoint
  sensitive = true
}

output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "cluster_location" {
  value = google_container_cluster.gke.location
}

output "master_ipv4_cidr_block" {
  value = google_container_cluster.gke.private_cluster_config[0].master_ipv4_cidr_block
}
