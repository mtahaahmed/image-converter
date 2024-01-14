resource "helm_release" "cert_manager" {
  name       = "image-converter"
  chart      = "../../chart/image-converter"
  version    = "v1.13.3"
  timeout    = 200

  depends_on = [google_pubsub_topic.example, google_service_account_key.example_key, google_sql_database_instance.main]
}