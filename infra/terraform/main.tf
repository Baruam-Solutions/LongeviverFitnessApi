# Bucket onde é compartilhado o remote terraform state
module "terraform_state_storage" {
  source = "./modules/state_bucket"
  terraform_state_bucket_name = "lgv_terraform_state_bucket"
}

# Carrega o ambiente de dev como exemplo
module "dev_rds" {
  source = "./environments/dev"
  project-id = var.project-id
}