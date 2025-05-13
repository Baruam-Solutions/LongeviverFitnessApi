variable "project_id" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "project_region" {
  description = "Região do recurso Artifact Registry na cloud"
  type        = string
}

variable "artifact_registry_repository_name" {
  description = "Nome do repositório do Artifact Registry"
  type        = string
}