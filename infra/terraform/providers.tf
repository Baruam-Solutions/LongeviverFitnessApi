# configurações para o terraform
terraform {
  required_providers {
    google = {
      version = "~> 6.12.0"
    }
  }
}

provider "google" {
  project = var.project-id
  region  = var.project-region
  zone    = var.project-zone
}