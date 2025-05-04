# configurações para o terraform
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
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}

data "google_client_config" "provider" {}

# provider "kubernetes" {
#   host                   = "https://${module.dev_rds.kubernetes_endpoint}"
#   token                  = data.google_client_config.provider.access_token
#   cluster_ca_certificate = base64decode(
#     module.dev_rds.kubernetes_cluster_ca_certificate
#   )
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "gke-gcloud-auth-plugin"
#   }
# }