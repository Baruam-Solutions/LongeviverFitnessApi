variable "project_id" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "service_account_k8s_email" {
  description = "Email do K8s service account"
  type        = string
}

variable "service_account_k8s_name" {
  description = "Nome do K8s service account"
  type        = string
}