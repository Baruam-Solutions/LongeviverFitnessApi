terraform {
  required_providers {
    google = {
      version = "~> 6.23.0"
    }
    kubernetes = {
      version = "~> 2.36.0"
    }
  }
}

provider "google" {
  project = var.PROJECT_ID
  region  = var.PROJECT_REGION
  zone    = var.PROJECT_ZONE
}

data "google_client_config" "provider" {}

provider "kubernetes" {
  host  = "https://${var.K8S_ENDPOINT}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    var.K8S_CERTIFICATE_AUTHORITY
  )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}