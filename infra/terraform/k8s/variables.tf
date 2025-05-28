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

variable "K8S_SERVICE_ACCOUNT_EMAIL" {
  description = "Email do K8s service"
  type        = string
}

variable "K8S_ENDPOINT" {
  description = "Endpoint do cluster K8s"
  type        = string
}

variable "K8S_CERTIFICATE_AUTHORITY" {
  description = "Certificado de autoridade do cluster K8s"
  type        = string
}

variable "DATABASE" {
  description = "Nome da base de dados para o projeto"
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

variable "K8S_SERVICE_ACCOUNT_NAME" {
  description = "Nome do K8s service account"
  type        = string
}