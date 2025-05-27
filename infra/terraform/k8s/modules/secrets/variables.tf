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

variable "cluster_namespace" {
  description = "Namespace do cluster Kubernetes onde o Secret será criado"
  type        = string
}