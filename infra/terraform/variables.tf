variable "project_id" {
  description = "Id do projeto na cloud"
  type        = string
  default     = "longeviver-dev-mateus-455600"
}

variable "project_region" {
  description = "Região do recurso na cloud"
  type        = string
  default     = "us-central1"
}

variable "project_zone" {
  description = "Zona do recurso na cloud"
  type        = string
  default     = "us-central1-c"
}

variable "terraform_state_bucket_name" {
  description = "Nome do bucket para armazenar o terraform state"
  type        = string
  default     = "lgv_terraform_state_bucket_mateus"
}