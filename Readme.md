# Disclaimer

This code has not been run on GCP yet.

## Image converter App

Here is a basic outline of the application:

- The API takes a URL and a name. It stores the job as pending in the database and raises a Cloud Pub/Sub event
- There is a worker subscribed to this topic that takes the URL in the message, downloads it to memory, converts the image to WebP and stores it in Cloud Storage.
- After the image is stored, EventArc is used to trigger another action in a worker that updates the database with the resulting URL.

## This repo contains:

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
