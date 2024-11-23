resource "google_storage_bucket" "terraform_state" {
  name                        = var.terraform_state_bucket_name   # Nome único para o bucket
  location                    = "US"                              # Localização do bucket
  storage_class               = "STANDARD"                        # Classe de armazenamento
  force_destroy               = false                             # Destroi o bucket e conteúdos
  uniform_bucket_level_access = true                              # Recomendado para controle de acesso uniforme

  versioning {
    enabled = true # Habilita versionamento para backups de estados
  }
}