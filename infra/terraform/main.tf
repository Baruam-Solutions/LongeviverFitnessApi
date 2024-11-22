# Carrega o ambiente de dev como exemplo
module "dev_rds" {
  source = "./environments/dev"
  project = var.project-id
}