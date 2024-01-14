
output "kubeconfig_path" {
  value = "~/.kube/config"  # Display the path to the kubeconfig file
}

output "service_account_email" {
  value = google_service_account.example.email
}

output "key_file" {
  value = google_service_account_key.example_key.private_key_json
}
