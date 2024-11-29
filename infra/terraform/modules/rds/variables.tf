variable "instance_name" {
  description = "Nome da instância do Cloud SQL"
  type        = string
  default     = "longevivier"
}

variable "database_version" {
  description = "Versão do PostgreSQL"
  type        = string
  default     = "POSTGRES_17"
}

variable "region" {
  description = "Região da instância"
  type        = string
}

variable "tier" {
  description = "Tipo de máquina do banco de dados"
  type        = string
}

variable "edition" {
  description = "A edição da instancia"
  type        = string
}

variable "database_name" {
  description = "Nome da base de dados para o projeto"
  type        = string
}

variable "deletion_protection" {
  description = "Habilita proteção de exclusão da instância "
  type        = bool
  default     = true
}

variable "id-project" {
  description = "Id do projeto na cloud"
  type        = string
}