# terraform {
#   backend "gcs" {
#     bucket = "new_lgv_terraform_state_bucket"   # Nome do bucket criado
#     prefix = "terraform/state"              # Caminho para o arquivo de estado
#   }
# }