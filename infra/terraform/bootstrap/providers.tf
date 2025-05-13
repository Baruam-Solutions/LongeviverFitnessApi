# configurações para o terraform
terraform {
  required_providers {
    google = {
      version = "~> 6.34.1"
    }
  }

  backend "gcs" {
    bucket = "lgv-terraform-bootstrap-state-mateus" # Nome do bucket criado
    prefix = "terraform/state"                      # Caminho para o arquivo de estado
  }
}

# configuração do provider google
provider "google" {
  project = var.PROJECT_ID
  region  = var.PROJECT_REGION
  zone    = var.PROJECT_ZONE
}