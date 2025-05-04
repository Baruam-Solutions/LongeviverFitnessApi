variable "project_id" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "project_region" {
    description = "Região do recurso na cloud"
    type        = string
}

variable "project_zone" {
    description = "Localização do recurso na cloud"
    type        = string
}

variable "terraform_state_bucket_name" {
  description = "Nome do cloud storage bucket para armazenar terraform state"
  type        = string
}