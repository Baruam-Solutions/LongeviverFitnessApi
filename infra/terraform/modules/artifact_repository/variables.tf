variable "id_project" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "artifact_region" {
  description = "Região do Artifact Registry"
  type        = string
  default     = "southamerica-east1"
}

variable "artifact_repository_name" {
  description = "Nome do repositório do Artifact Registry"
  type        = string
  default     = "longeviverfitness-repositorio"
}