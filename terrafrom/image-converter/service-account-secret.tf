resource "kubernetes_secret" "example_secret" {
  metadata {
    name = "service-account-cred"
  }

  data = {
    "key.json" = google_service_account_key.example_key.private_key_json
  }
}
