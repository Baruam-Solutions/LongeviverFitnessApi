# Bucket onde é compartilhado o remote terraform state
module "terraform_state_storage" {
  source                      = "./modules/state_bucket"
  terraform_state_bucket_name = "lgv_terraform_state_bucket_franciel_6"
}

# Carrega o ambiente de dev como exemplo
module "dev_rds" {
  source     = "./environments/dev"
  project_id = var.project_id
}