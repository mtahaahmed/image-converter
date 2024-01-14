# Disclaimer

This code has not been run on GCP yet.

## Image converter App

This repo contains:

1. Image converter python app
2. Dockerfile
3. Terraform setup for necessary resources (See Terraform Readme for [cluster](terrafrom/gke-cluster/README.md) & [app-specific-resources](terrafrom/image-converter/README.md)).

## Image URL

Docker image has already been pushed to my personal docker-hub [account](https://hub.docker.com/repository/docker/tahakarachi/image-converter/general)

## Some important Notes

- Ingress controller setup has not been included here.
- HPA for app needs metrics server installation

## Future Improvements

- Just found out that instead of using `service account` for GCP resource access, we could use `workload identity federation`.
- More details [here](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity)
- We could also use [GKE node pool service accounts](https://cloud.google.com/kubernetes-engine/docs/how-to/service-accounts)
