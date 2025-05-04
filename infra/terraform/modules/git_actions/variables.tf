variable "id_project" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "github_repo" {
    description = "Nome do repositório no GitHub"
    type        = string
}

variable "artifact_registry_repository_name" {
  description = "Nome do repositório do Artifact Registry"
  type        = string
}

variable "artifact_registry_repository_region" {
  description = "Região do Artifact Registry"
  type        = string
}

variable "terraform_state_bucket_name" {
  description = "Nome do cloud storage bucket para armazenar terraform state"
  type        = string
}
