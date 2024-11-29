terraform {
  backend "gcs" {
    bucket  = "lgv_terraform_state_bucket"   # Nome do bucket criado
    prefix  = "terraform/state"              # Caminho para o arquivo de estado
  }
}