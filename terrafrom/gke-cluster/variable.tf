variable "project_id" {
  type = string
  default = "devops-challenge-411209"
}

variable "region" {
  type = string
  default = "europe-west4"
}

variable "cluster_name" {
  type = string
  default = "image-converter"
}

variable "master_ipv4_cidr_block" {
  type = string
  default = "172.16.0.128/28"
}