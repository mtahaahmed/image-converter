<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.11.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.11.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0, < 3.0.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.23.0, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_eventarc_channel.primary](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/eventarc_channel) | resource |
| [google_eventarc_trigger.primary](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/eventarc_trigger) | resource |
| [google_project_iam_binding.eventarc_binding](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.pubsub_binding](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.sql_binding](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.storage_binding](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/project_iam_binding) | resource |
| [google_pubsub_topic.example](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/pubsub_topic) | resource |
| [google_service_account.example](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/service_account) | resource |
| [google_service_account_key.example_key](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/service_account_key) | resource |
| [google_sql_database_instance.main](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/sql_database_instance) | resource |
| [google_storage_bucket.static-site](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/resources/storage_bucket) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_secret.example_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [google_container_cluster.current](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/data-sources/container_cluster) | data source |
| [google_service_account_access_token.current](https://registry.terraform.io/providers/hashicorp/google/5.11.0/docs/data-sources/service_account_access_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"image-converter"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | n/a | `string` | `"My First Project"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"europe-west3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_file"></a> [key\_file](#output\_key\_file) | n/a |
| <a name="output_kubeconfig_path"></a> [kubeconfig\_path](#output\_kubeconfig\_path) | n/a |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | n/a |
<!-- END_TF_DOCS -->