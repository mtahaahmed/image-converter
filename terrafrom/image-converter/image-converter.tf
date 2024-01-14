resource "helm_release" "cert_manager" {
  name       = "image-converter"
  chart      = "../../chart/image-converter"
  version    = "v1.13.3"
  timeout    = 900
}