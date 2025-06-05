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

variable "PROJECT_NUMBER" {
  description = "Número do projeto na cloud"
  type        = string
}

variable "ARTIFACT_REGISTRY_REPOSITORY_NAME" {
  description = "Nome do repositório do Artifact Registry"
  type        = string
}

variable "GIT_REPO" {
  description = "Nome do repositório no GitHub"
  type        = string
}

variable "GIT_POOL" {
  description = "Nome do pool do GitHub Actions"
  type        = string
}

variable "GIT_PROVIDER" {
  description = "Nome do provider do GitHub"
  type        = string
}