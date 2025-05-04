# Bucket onde é compartilhado o remote terraform state
module "terraform_state_storage" {
  source                      = "./modules/state_bucket"
  terraform_state_bucket_name = var.terraform_state_bucket_name
}

# Carrega o ambiente de dev como exemplo
module "dev_rds" { // TODO: RENOMEAR PARA dev_env
  source     = "./environments/dev"
  project_id = var.project_id
  project_region = var.project_region
  project_zone = var.project_zone
    terraform_state_bucket_name = var.terraform_state_bucket_name
}