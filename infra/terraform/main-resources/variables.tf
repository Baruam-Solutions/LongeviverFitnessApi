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

variable "DATABASE" {
  description = "Nome da base de dados para o projeto"
  type        = string
}

variable "DB_INSTANCE_NAME" {
  description = "Nome da instância do Cloud SQL"
  type        = string
}

variable "DB_USERNAME" {
  description = "Nome do usuário da base de dados"
  type        = string
}

variable "DB_PASSWORD" {
  description = "Senha do usuário da base de dados"
  type        = string
  sensitive   = true
}

variable "DB_DELETION_PROTECTION" {
  description = "Habilita proteção de exclusão da instância"
  type        = bool
  default     = true
}

variable "DB_VERSION" {
  description = "Versão do PostgreSQL"
  type        = string
}

variable "DB_TIER" {
  description = "Tipo de máquina do banco de dados"
  type        = string
}

variable "DB_EDITION" {
  description = "A edição da instancia"
  type        = string
}

variable "GKE_CLUSTER_NAME" {
  description = "Nome do cluster Kubernetes"
  type        = string
}

variable "GKE_NODE_MACHINE_TYPE" {
  description = "Tipo de máquina para os nós do cluster Kubernetes"
  type        = string
}

variable "GKE_INITIAL_NODE_COUNT" {
  description = "Número inicial de nós no cluster Kubernetes"
  type        = number
  default     = 1
}

variable "GKE_NODE_POOL_NAME" {
  description = "Nome do Node Pool do cluster Kubernetes"
  type        = string
  default     = "logeviver-dev-node-pool"
}

variable "GKE_PREEMPTIBLE" {
  description = "Define se serão utilizadas máquinas mais baratas que podem ser encerradas pelo Google"
  type        = bool
  default     = false
}