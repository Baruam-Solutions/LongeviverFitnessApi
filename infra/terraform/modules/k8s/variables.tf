variable "id_project" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "cluster_name" {
  description = "Nome do cluster Kubernetes"
  type        = string
}

variable "service_account_k8s_email" {
  description = "Email do K8s service"
  type        = string
}

variable "database" {
    description = "Nome da base de dados para o projeto"
    type        = string
}

variable username {
    description = "Nome do usuário da base de dados"
    type        = string
}

variable "password" {
    description = "Senha do usuário da base de dados"
    type        = string
    sensitive   = true
}
