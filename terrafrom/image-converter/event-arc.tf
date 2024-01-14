resource "google_eventarc_trigger" "primary" {
    name = "name"
    location = var.region
    matching_criteria {
        attribute = "type"
        value = "google.cloud.pubsub.topic.v1.messagePublished"
    }
    destination {
        cloud_run_service {
            service = google_cloud_run_service.default.name  # could be any worker mentioned in the requirement doc
            region = var.region
        }
    }
    labels = {
        foo = "bar"
    }
}
