variable "project_id" {
  description = "Id do projeto na cloud"
  type        = string
}

variable "cluster_name" {
  description = "Nome do cluster Kubernetes"
  type        = string
}

variable "cluster_location" {
  description = "Região onde o cluster será provisionado"
  type        = string
}

variable "node_machine_type" {
  description = "Tipo de máquina para os nós do cluster"
  type        = string
  default     = "e2-medium"
}

variable "initial_node_count" {
  description = "Número inicial de nós no cluster"
  type        = number
  default     = 2
}

variable "name_node_pool" {
  description = "Nome do Node Pool"
  type        = string
}

variable "preemptible" {
  description = "Define se serão utilizadas máquinas mais baratas que podem ser encerradas pelo Google"
  type        = bool
}

variable "gh_actions_service_account_email" {
  description = "Conta de serviço para o GitHub Actions"
  type        = string
}
