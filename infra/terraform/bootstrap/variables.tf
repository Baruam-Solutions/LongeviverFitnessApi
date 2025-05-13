variable "PROJECT_ID" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "PROJECT_REGION" {
  description = "Região do recurso na cloud"
  type        = string
}

variable "PROJECT_ZONE" {
  description = "Zona do recurso na cloud"
  type        = string
}

variable "BOOTSTRAP_STATE_BUCKET_NAME" {
  description = "Nome do cloud storage bucket para armazenar terraform state para o bootstrap"
  type        = string
}

variable "ARTIFACT_REGISTRY_REPOSITORY_NAME" {
  description = "Nome do repositório do Artifact Registry"
  type        = string
}

variable "GITHUB_REPO" {
  description = "Nome do repositório no GitHub"
  type        = string
}