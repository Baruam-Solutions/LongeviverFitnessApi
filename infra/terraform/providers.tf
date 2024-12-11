# configurações para o terraform
terraform {
  required_providers {
    google = {
      version = "~> 6.12.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}